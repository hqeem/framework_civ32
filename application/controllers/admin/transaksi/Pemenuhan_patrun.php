<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: hqeem
 * Date: 5/31/2017
 * Time: 1:14 PM
 */


/**
 * @property  ion_auth $ion_auth
 * @property  pemenuhan_patrun_model $pemenuhan_patrun_model
 * @property  datatables $datatables
 * @property  detail_pemenuhan_patrun_model $detail_pemenuhan_patrun_model
 */
class Pemenuhan_patrun extends Admin_Controller
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
        $this->load->model('pemenuhan_patrun_model');
        $this->load->model('detail_pemenuhan_patrun_model');
    }

    public function index()
    {
        $this->render('admin/transaksi/pemenuhan_patrun_view');
    }

    public function get_data_all(){

        $list = $this->pemenuhan_patrun_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            // $row[] = $dt->id;
            $row[] = $this->tanggal($dt->tanggal);
            $row[] = $dt->nomor_do;
            $row[] = $dt->kode_relasi;
            $row[] = $dt->nama_relasi;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_pemenuhan_patrun('."'".$dt->id."'".')"><i class="glyphicon glyphicon-pencil"></i> Edit</a>
                  <a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_pemenuhan_patrun('."'".$dt->id."'".')"><i class="glyphicon glyphicon-trash"></i> Delete</a>
                  <a class="btn btn-sm btn-success" href="javascript:void(0)" title="Print" onclick="print_pemenuhan_patrun('."'".$dt->id."'".')"><i class="glyphicon glyphicon-print"></i> Print</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->pemenuhan_patrun_model->count_all(),
            "recordsFiltered" => $this->pemenuhan_patrun_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->pemenuhan_patrun_model->get($id);
        $data  = array(
            'id' => $data->id,
            'tanggal' => $this->tanggal($data->tanggal),
            'nomor_do' => $data->nomor_do,
            'kode_relasi' => $data->kode_relasi,
            'nama_relasi' => $data->nama_relasi,
            'detailPemenuhan_patrun'=> (array) $this->detail_pemenuhan_patrun_model->getDataByTransaksi($id)
        );
        echo json_encode(array($data));
    }

    public function add()
    {

        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);

        $data = array(
            'tanggal' => $this->tanggaldb($this->input->post('tanggal')),
            'nomor_do' => $this->input->post('nomor_do'),
            'kode_relasi' => $this->input->post('kode_relasi'),
            'nama_relasi' => $this->input->post('nama_relasi')
        );
        $insert = $this->pemenuhan_patrun_model->save($data);
        $id = $this->db->insert_id();

        if($id){
            $i=0;
            foreach ($json as $ax) :
                if(!is_object($ax)){
                    if(is_string($ax[0])){
                        $data_detail = array(
                            'id_pemenuhan_patrun' => $id,
                            'kode_patrun' => $ax[1],
                            'pakan' => $ax[2],
                            'lusi' => $ax[3]
                        );
                        $this->detail_pemenuhan_patrun_model->insert($data_detail);
                    }
                }
                $i++;
            endforeach;
        }

        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);

        $data = array(
            'tanggal' => $this->tanggaldb($this->input->post('tanggal')),
            'nomor_do' => $this->input->post('nomor_do'),
            'kode_relasi' => $this->input->post('kode_relasi'),
            'nama_relasi' => $this->input->post('nama_relasi')
        );
        $this->pemenuhan_patrun_model->update_by_id(array('id' => $this->input->post('id')), $data);

        $datay = $this->detail_pemenuhan_patrun_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_pemenuhan_patrun_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_pemenuhan_patrun' => $this->input->post('id'),
                            'kode_patrun' => $ax[1],
                            'pakan' => $ax[2],
                            'lusi' => $ax[3]
                        );
                        $this->detail_pemenuhan_patrun_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;

        echo json_encode(array("status" => TRUE));
    }

    public function delete($id)
    {
        $datay = $this->detail_pemenuhan_patrun_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_pemenuhan_patrun_model->delete($rw['id']);
        endforeach;

        $this->pemenuhan_patrun_model->delete($id);
        echo json_encode(array("status" => TRUE));
    }

    public function combo_tambah_patrun(){
        $and_or = $this->input->get('and_or');
        $order_by = $this->input->get('order_by');
        $page_num= $this->input->get('page_num');
        $per_page= $this->input->get('per_page');
        $q_word= $this->input->get('q_word');
        $search_field= $this->input->get('search_field');

        $datanya = $this->pemenuhan_patrun_model->combo_tambah_patrun($and_or,$order_by,$page_num,$per_page,$q_word,$search_field);
        echo json_encode($datanya);
    }

    public function combo_nomor_do(){
        $and_or = $this->input->get('and_or');
        $order_by = $this->input->get('order_by');
        $page_num= $this->input->get('page_num');
        $per_page= $this->input->get('per_page');
        $q_word= $this->input->get('q_word');
        $search_field= $this->input->get('search_field');

        $datanya = $this->pemenuhan_patrun_model->combo_nomor_do($and_or,$order_by,$page_num,$per_page,$q_word,$search_field);
        echo json_encode($datanya);
    }

    public function get_do_by_nomor($no)
    {
        $data = $this->pemenuhan_patrun_model->get_do_by_nomor($no);
        $data  = array(
            'id' => $data->id,
            'nomor_do' => $data->nomor_do,
            'tanggal_do' => $data->tanggal_do,
            'tanggal_kirim' => $data->tanggal_kirim,
            'kode_relasi' => $data->kode_relasi,
            'nama_relasi' => $data->nama_relasi,
            'jumlah_order' => $data->jumlah_order,
            'keterangan' => $data->keterangan,
            'detailDelivery_order'=> (array) null
        );
        echo json_encode(array($data));
    }

}