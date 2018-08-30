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
 * @property  mutasi_beam_model $mutasi_beam_model
 */
class Mutasi_beam extends Admin_Controller
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
        $this->load->model('mutasi_beam_model');
    }

    public function index()
    {
        $this->render('admin/transaksi/mutasi_beam_view');
    }

    public function get_data_all()
    {

        $list = $this->mutasi_beam_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $dt->no_sj;
            $row[] = $this->tanggal($dt->tgl_krm);
            $row[] = $dt->transaksi;
            $row[] = $dt->lokasi;
            $row[] = $dt->no_kik;
            $row[] = $dt->no_patrun;
            $row[] = $dt->no_beam;
            $row[] = $dt->pjg_bng;
            $row[] = $dt->pu;
            $row[] = $dt->brt_bng;
            $row[] = $dt->brt_net;
            $row[] = $dt->kode1;
            $row[] = $dt->wrn_dsr;
            $row[] = $dt->motif;
            $row[] = $dt->kode_prod;
            $row[] = $dt->no_sisir;
            $row[] = $dt->group;
            $row[] = $dt->shift;
            $row[] = $dt->grade;
            $row[] = $dt->remark;
            $row[] = $dt->cek;
            $row[] = $this->tanggal($dt->tgl_cek);
            $row[] = $dt->password;
            $row[] = $dt->entry;
            $row[] = $dt->cek1;
            $row[] = $this->tanggal($dt->tgl_cek1);
            $row[] = $dt->password1;
            $row[] = $this->tanggal($dt->tgl_trm);
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Detail" onclick="detail_mutasi_beam(' . "'" . $dt->id . "'" . ')"><i class="glyphicon glyphicon-list"></i> Detail</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->mutasi_beam_model->count_all(),
            "recordsFiltered" => $this->mutasi_beam_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->mutasi_beam_model->get($id);
        $data = array(
            'id' => $data->id,
            'nomor_kik' => $data->nomor_kik,
            'tanggal_kik' => $this->tanggal($data->tanggal_kik),
            'kode_produk' => $data->kode_produk,
            'panjang' => $data->panjang,
            'jumlah_benang' => $data->jumlah_benang,
            'detailMutasi_beam' => (array)null
        );
        echo json_encode(array($data));
    }

    public function detail($id)
    {
        $data = $this->mutasi_beam_model->get($id);
        $data = array(
            'detailMutasi_beam' => (array)$this->mutasi_beam_model->get_detail($id)
        );
        echo json_encode(array($data));
    }

    public function import()
    {
        $current_no_kik = '';
        $jml = 0;

        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);
        
        $tgl = $this->input->post('tanggal');
        $tgl = explode("/",$tgl);
        $tanggal = $tgl[2].$tgl[0].$tgl[1];

        $this->mutasi_beam_model->delete_by_tgl($tanggal);

        $table = new Table('D:/mutbeam.dbf');
        $columns = $table->getColumns();

        while ($record = $table->nextRecord()) {
            $data = array();
            $data_details = array();

            foreach ($columns as $column) {
                if (!empty($record->forceGetString($column->name))) {
                    $data[$column->getName()] = $record->forceGetString($column->name);
                }
            }
                        
            if ($data['tgl_krm'] == $tanggal) {
                if ($data['transaksi'] == 'PENERIMAAN') {
                    if ($current_no_kik != $data['no_kik']) {
                        $current_no_kik = $data['no_kik'];
                        $jml = 1;
                    } else {
                        $jml++;
                    }

                    $insert = $this->mutasi_beam_model->save($data);
                    $id = $this->db->insert_id();

                    $this->mutasi_beam_model->update_monitoring($data['no_kik'], $data['tgl_krm'], $jml);
                }
            }
            
            // echo '<pre>'; print_r($data); echo '</pre>';
        }

        echo json_encode(array("status" => true));

    }

    public function add()
    {
        $datax = $this->input->post('dataDetail');
        $json = json_decode($datax);
        
        $tanggal = $this->tanggaldb($this->input->post('tanggal'));

        $this->import($tanggal);

        echo json_encode(array("status" => true));
    }

    public function update()
    {
        $datax = $this->input->post('dataDetail');
        $json = json_decode($datax);

        $data = array(
            'nomor_kik' => $this->input->post('nomor_kik'),
            'tanggal_kik' => $this->tanggaldb($this->input->post('tanggal_kik')),
            'kode_produk' => $this->input->post('kode_produk'),
            'panjang' => $this->input->post('panjang'),
            'jumlah_benang' => $this->input->post('jumlah_benang')
        );
        $this->mutasi_beam_model->update_by_id(array('id' => $this->input->post('id')), $data);

        // Matikan kalau tidak ada Detail.

        /*$datay = $this->detail_mutasi_beam_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_mutasi_beam_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_mutasi_beam' => $this->input->post('id'),
                            'mutasi_beam' => $ax[1]
                        );
                        $this->detail_mutasi_beam_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;*/

        echo json_encode(array("status" => true));
    }

    public function delete($id)
    {
        // Matikan kalau tidak ada detail
        /*$datay = $this->detail_mutasi_beam_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_mutasi_beam_model->delete($rw['id']);
        endforeach;*/

        $this->mutasi_beam_model->delete($id);
        echo json_encode(array("status" => true));
    }


}