<?php defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: hqeem
 * Date: 5/31/2017
 * Time: 1:14 PM
 */
use XBase\Table;
use XBase\Column;
use XBase\Record;

/**
 * @property  ion_auth $ion_auth
 * @property  ikt_model $ikt_model
 */
class Ikt extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        if (!$this->ion_auth->in_group('admin')) {
            redirect('auth/session_not_authorized', 'refresh');
        }
        $this->load->library('form_validation');
        $this->load->helper('text');
        $this->load->helper('url');
        $this->load->model('ikt_model');
    }

    public function index()
    {
        $this->render('admin/master/ikt_view');
    }

    public function get_data_all()
    {
        $list = $this->ikt_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $dt->no_kik;
            $row[] = $this->tanggal($dt->tgl_kik);
            $row[] = $dt->kode_prod;
            $row[] = $dt->pjg;
            $row[] = $dt->jml_bng;
            $row[] = $dt->no_patrun;
            $row[] = $dt->motif;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Detail" onclick="detail_ikt(' . "'" . $dt->id . "'" . ')"><i class="glyphicon glyphicon-list"></i> Detail</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->ikt_model->count_all(),
            "recordsFiltered" => $this->ikt_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function detail($id)
    {
        $data = $this->ikt_model->get($id);
        $data = array(
            'detailIkt' => (array)$this->ikt_model->get_detail($id)
        );
        echo json_encode(array($data));
    }

    public function import()
    {        
        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);
        
        $tgl = $this->input->post('tanggal');
        $tgl = explode("/",$tgl);
        $tanggal = $tgl[2].$tgl[0].$tgl[1];

        $table = new Table('D:/kikppc.dbf');
        $columns = $table->getColumns();

        while ($record = $table->nextRecord()) {
            $data = array();
            $data_details = array();
            $lusi_count = 0;
            $pakan_count = 0;
            $sulur_count = 0;
            $tumpal_count = 0;

            foreach ($columns as $column) {
                if (!empty($record->forceGetString($column->name))) {
                    if ($column->getName() == 'no_kik') {
                        $data['no_kik'] = $record->forceGetString($column->name);
                    } else if ($column->getName() == 'tgl_kik') {
                        $data['tgl_kik'] = $record->forceGetString($column->name);
                    } else if ($column->getName() == 'kode_prod') {
                        $data['kode_prod'] = $record->forceGetString($column->name);
                    } else if ($column->getName() == 'pjg') {
                        $data['pjg'] = round($record->forceGetString($column->name), 0);
                    } else if ($column->getName() == 'jml_bng') {
                        $data['jml_bng'] = $record->forceGetString($column->name);
                    } else if ($column->getName() == 'no_patrun') {
                        $data['no_patrun'] = $record->forceGetString($column->name);
                    } else if ($column->getName() == 'motif') {
                        $data['motif'] = $record->forceGetString($column->name);
                    } else if (strpos($column->getName(), 'lusi') !== false) {
                        $lusi_count++;
                        $data_details[$lusi_count]['lusi'] = $record->forceGetString($column->name);
                    } else if (strpos($column->getName(), 'pakan') !== false) {
                        $pakan_count++;
                        $data_details[$pakan_count]['pakan'] = $record->forceGetString($column->name);
                    } else if (strpos($column->getName(), 'sulur') !== false) {
                        $sulur_count++;
                        $data_details[$sulur_count]['sulur'] = $record->forceGetString($column->name);
                    } else if (strpos($column->getName(), 'tumpal') !== false) {
                        $tumpal_count++;
                        $data_details[$tumpal_count]['tumpal'] = $record->forceGetString($column->name);
                    }
                }
            }
            
            if ($data['tgl_kik'] == $tanggal) {
                if ($this->ikt_model->check_similar_item($data) == false) {
                    $insert = $this->ikt_model->save($data);
                    $id = $this->db->insert_id();
    
                    foreach ($data_details as $data_detail) {
                        if (!($data_detail['lusi'] == 0 && $data_detail['pakan'] == 0 && $data_detail['sulur'] == 0 && $data_detail['tumpal'] == 0)) {
                            $data_detail['id_ikt'] = $id;
                            $data_detail['no_patrun'] = $data['no_patrun'];
                            $data_detail['motif'] = $data['motif'];
    
                            $insert_detail = $this->ikt_model->save_detail($data_detail);
                        }
                    }
    
                    $this->ikt_model->update_monitoring($data['no_kik']);
                }
            }
            
            // echo '<pre>'; print_r($data); echo '</pre>';
        }

        // redirect('admin/master/ikt', 'refresh');
        
        echo json_encode(array("status" => true));

    }
}