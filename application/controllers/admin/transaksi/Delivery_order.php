<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: hqeem
 * Date: 5/31/2017
 * Time: 1:14 PM
 */


/**
 * @property  ion_auth $ion_auth
 * @property  delivery_order_model $delivery_order_model
 */
class Delivery_order extends Admin_Controller
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
        $this->load->model('delivery_order_model');
    }

    public function index()
    {
        $this->render('admin/transaksi/delivery_order_view');
    }

    public function get_data_all(){

        $list = $this->delivery_order_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            // $row[] = $dt->id;
            $row[] = $dt->nomor_do;
            $row[] = $this->tanggal($dt->tanggal_do);
            $row[] = $this->tanggal($dt->tanggal_kirim);
            $row[] = $dt->kode_relasi;
            $row[] = $dt->nama_relasi;
            $row[] = $dt->jumlah_order;
            $row[] = $dt->keterangan;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_delivery_order('."'".$dt->id."'".')"><i class="glyphicon glyphicon-pencil"></i> Edit</a>
				  <a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_delivery_order('."'".$dt->id."'".')"><i class="glyphicon glyphicon-trash"></i> Delete</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->delivery_order_model->count_all(),
            "recordsFiltered" => $this->delivery_order_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->delivery_order_model->get($id);
        $data  = array(
            'id' => $data->id,
            'nomor_do' => $data->nomor_do,
            'tanggal_do' => $this->tanggal($data->tanggal_do),
            'tanggal_kirim' => $this->tanggal($data->tanggal_kirim),
            'kode_relasi' => $data->kode_relasi,
            'nama_relasi' => $data->nama_relasi,
            'jumlah_order' => $data->jumlah_order,
            'keterangan' => $data->keterangan,
            'detailDelivery_order'=> (array) null
        );
        echo json_encode(array($data));
    }

    public function get_relasi_by_kode($kode)
    {
        $data = $this->delivery_order_model->get_relasi_by_kode($kode);
        $data  = array(
            'id' => $data->id,
            'kode' => $data->kode,
            'nama' => $data->nama,
            'alamat' => $data->alamat,
            'detailDelivery_order'=> (array) null
        );
        echo json_encode(array($data));
    }

    public function add()
    {

        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);

        $data = array(
            'nomor_do' => $this->input->post('nomor_do'),
            'tanggal_do' => $this->tanggaldb($this->input->post('tanggal_do')),
            'tanggal_kirim' => $this->tanggaldb($this->input->post('tanggal_kirim')),
            'kode_relasi' => $this->input->post('kode_relasi'),
            'nama_relasi' => $this->input->post('nama_relasi'),
            'jumlah_order' => $this->input->post('jumlah_order'),
            'keterangan' => $this->input->post('keterangan')
        );
        $insert = $this->delivery_order_model->save($data);
        $id = $this->db->insert_id();

        // Matikan Kalau tidak ada detail
        /*if($id){
            $i=0;
            foreach ($json as $ax) :
                if(!is_object($ax)){
                    if(is_string($ax[0])){
                        $data_detail = array(
                            'id_barang' => $id,
                            'barang' => $ax[1]
                        );
                        $this->detail_barang_model->insert($data_detail);
                    }
                }
                $i++;
            endforeach;
        }*/

        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);

        $data = array(
            'nomor_do' => $this->input->post('nomor_do'),
            'tanggal_do' => $this->tanggaldb($this->input->post('tanggal_do')),
            'tanggal_kirim' => $this->tanggaldb($this->input->post('tanggal_kirim')),
            'kode_relasi' => $this->input->post('kode_relasi'),
            'nama_relasi' => $this->input->post('nama_relasi'),
            'jumlah_order' => $this->input->post('jumlah_order'),
            'keterangan' => $this->input->post('keterangan')
        );
        $this->delivery_order_model->update_by_id(array('id' => $this->input->post('id')), $data);

        // Matikan kalau tidak ada Detail.

        /*$datay = $this->detail_barang_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_barang_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_barang' => $this->input->post('id'),
                            'barang' => $ax[1]
                        );
                        $this->detail_barang_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;*/

        echo json_encode(array("status" => TRUE));
    }

    public function delete($id)
    {
        // Matikan kalau tidak ada detail
        /*$datay = $this->detail_barang_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_barang_model->delete($rw['id']);
        endforeach;*/

        $this->delivery_order_model->delete($id);
        echo json_encode(array("status" => TRUE));
    }
  
    public function combo_kode_relasi(){
        $and_or = $this->input->get('and_or');
        $order_by = $this->input->get('order_by');
        $page_num= $this->input->get('page_num');
        $per_page= $this->input->get('per_page');
        $q_word= $this->input->get('q_word');
        $search_field= $this->input->get('search_field');

        $datanya = $this->delivery_order_model->combo_kode_relasi($and_or,$order_by,$page_num,$per_page,$q_word,$search_field);
        echo json_encode($datanya);
    }


}