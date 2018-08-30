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
 * @property  warping_model $warping_model
 */
class Warping extends Admin_Controller
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
        $this->load->model('warping_model');
    }

    public function index()
    {
        $this->render('admin/transaksi/warping_view');
    }

    public function get_data_all()
    {

        $list = $this->warping_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $this->tanggal($dt->tgl_inp);
            $row[] = $this->tanggal($dt->prs_date);
            $row[] = $dt->no_kik;
            $row[] = $dt->no_patrun;
            $row[] = $dt->jns_beam;
            $row[] = $dt->kode_msn;
            $row[] = $dt->no_beam;
            $row[] = $dt->jml_bng;
            $row[] = $dt->waste;
            $row[] = $dt->pjg_bng;
            $row[] = $dt->kode_prod;
            $row[] = $dt->bngkr_stfn;
            $row[] = $dt->bongkar_lm;
            $row[] = $dt->corak_stfn;
            $row[] = $dt->corak_lm;
            $row[] = $dt->wkt_stfn;
            $row[] = $dt->wkt_lm;
            $row[] = $dt->lain_stfn;
            $row[] = $dt->lain_lm;
            $row[] = $dt->prod_stfn;
            $row[] = $dt->prod_lm;
            $row[] = $dt->pbl1_stfn;
            $row[] = $dt->pbl1_lm;
            $row[] = $dt->pbl2_stfn;
            $row[] = $dt->pbl2_lm;
            $row[] = $dt->pbl3_stfn;
            $row[] = $dt->pbl3_lm;
            $row[] = $dt->brt_kosong;
            $row[] = $dt->brt_benang;
            $row[] = $dt->netto;
            $row[] = $dt->pts_yard;
            $row[] = $dt->pts_tot;
            $row[] = $dt->op_grp1;
            $row[] = $dt->op_sft1;
            $row[] = $dt->op_code1;
            $row[] = $dt->op_code2;
            $row[] = $dt->op_grp2;
            $row[] = $dt->op_sft2;
            $row[] = $dt->op_code3;
            $row[] = $dt->op_grp3;
            $row[] = $dt->op_sft3;
            $row[] = $dt->kode_pbl1;
            $row[] = $dt->kode_pbl2;
            $row[] = $dt->kode_pbl3;
            $row[] = $dt->flag;
            $row[] = $dt->cek;
            $row[] = $this->tanggal($dt->tgl_cek);
            $row[] = $dt->password;
            $row[] = $dt->entry;
            $row[] = $dt->cek1;
            $row[] = $this->tanggal($dt->tgl_cek1);
            $row[] = $dt->password1;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Detail" onclick="detail_warping(' . "'" . $dt->id . "'" . ')"><i class="glyphicon glyphicon-list"></i> Detail</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->warping_model->count_all(),
            "recordsFiltered" => $this->warping_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->warping_model->get($id);
        $data = array(
            'id' => $data->id,
            'nomor_kik' => $data->nomor_kik,
            'tanggal_kik' => $this->tanggal($data->tanggal_kik),
            'kode_produk' => $data->kode_produk,
            'panjang' => $data->panjang,
            'jumlah_benang' => $data->jumlah_benang,
            'detailWarping' => (array)null
        );
        echo json_encode(array($data));
    }

    public function detail($id)
    {
        $data = $this->warping_model->get($id);
        $data = array(
            'detailWarping' => (array)$this->warping_model->get_detail($id)
        );
        echo json_encode(array($data));
    }

    public function import()
    {
        //seluruh isi dalam tabel akan dihapus sebelum insert
        // $this->warping_model->reset_table();
        $current_no_kik = '';
        $jml = 0;

        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);
        
        $tgl = $this->input->post('tanggal');
        $tgl = explode("/",$tgl);
        $tanggal = $tgl[2].$tgl[0].$tgl[1];
        
        $this->warping_model->delete_by_tgl($tanggal);

        $table = new Table('D:/warping.dbf');
        $columns = $table->getColumns();

        while ($record = $table->nextRecord()) {
            $data = array();
            $data_details = array();

            foreach ($columns as $column) {
                if (!empty($record->forceGetString($column->name))) {
                    $data[$column->getName()] = $record->forceGetString($column->name);
                }
            }

            if ($data['prs_date'] == $tanggal) {
                if ($current_no_kik != $data['no_kik']) {
                    $current_no_kik = $data['no_kik'];
                    $jml = 1;
                } else {
                    $jml++;
                }

                $insert = $this->warping_model->save($data);
                $id = $this->db->insert_id();

                $this->warping_model->update_monitoring($data['no_kik'], $data['prs_date'], $jml);
            }
            
            // if ($this->warping_model->check_similar_item($data) == false) {
            //     $insert = $this->warping_model->save($data);
            //     $id = $this->db->insert_id();
            // }
            
            // echo '<pre>'; print_r($data); echo '</pre>';
        }

        // redirect('admin/transaksi/warping', 'refresh');

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
        $this->warping_model->update_by_id(array('id' => $this->input->post('id')), $data);

        // Matikan kalau tidak ada Detail.

        /*$datay = $this->detail_warping_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_warping_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_warping' => $this->input->post('id'),
                            'warping' => $ax[1]
                        );
                        $this->detail_warping_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;*/

        echo json_encode(array("status" => true));
    }

    public function delete($id)
    {
        // Matikan kalau tidak ada detail
        /*$datay = $this->detail_warping_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_warping_model->delete($rw['id']);
        endforeach;*/

        $this->warping_model->delete($id);
        echo json_encode(array("status" => true));
    }


}