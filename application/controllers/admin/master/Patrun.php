<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: hqeem
 * Date: 5/31/2017
 * Time: 1:14 PM
 */


/**
 * @property  ion_auth $ion_auth
 * @property  patrun_model $patrun_model
 * @property  datatables $datatables
 * @property  detail_patrun_model $detail_patrun_model
 */
class Patrun extends Admin_Controller
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
        $this->load->model('patrun_model');
        $this->load->model('detail_patrun_model');
    }

    public function index()
    {
        $this->render('admin/master/patrun_view');
    }

    public function get_data_all(){

        $list = $this->patrun_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            // $row[] = $dt->id;
            $row[] = $dt->kode;
            $row[] = $this->tanggal($dt->tanggal);
            $row[] = $dt->motif;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_patrun('."'".$dt->id."'".')"><i class="glyphicon glyphicon-pencil"></i> Edit</a>
				  <a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_patrun('."'".$dt->id."'".')"><i class="glyphicon glyphicon-trash"></i> Delete</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->patrun_model->count_all(),
            "recordsFiltered" => $this->patrun_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->patrun_model->get($id);
        $data  = array(
            'id' => $data->id,
            'kode' => $data->kode,
            'tanggal' => $this->tanggal($data->tanggal),
            'motif' => $data->motif,
            'detailPatrun'=> (array) $this->detail_patrun_model->getDataByTransaksi($id)
        );
        echo json_encode(array($data));
    }

    public function add()
    {

        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);

        $data = array(
            'kode' => $this->input->post('kode'),
            'tanggal' => $this->tanggaldb($this->input->post('tanggal')),
            'motif' => $this->input->post('motif')
        );
        $insert = $this->patrun_model->save($data);
        $id = $this->db->insert_id();

        if($id){
            $i=0;
            foreach ($json as $ax) :
                if(!is_object($ax)){
                    if(is_string($ax[0])){
                        $data_detail = array(
                            'id_patrun' => $id,
                            'nama_benang' => $ax[1],
                            'lusi' => $ax[2],
                            'pakan' => $ax[3]
                        );
                        $this->detail_patrun_model->insert($data_detail);
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
            'kode' => $this->input->post('kode'),
            'tanggal' => $this->tanggaldb($this->input->post('tanggal')),
            'motif' => $this->input->post('motif')
        );
        $this->patrun_model->update_by_id(array('id' => $this->input->post('id')), $data);

        $datay = $this->detail_patrun_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_patrun_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_patrun' => $this->input->post('id'),
                            'nama_benang' => $ax[1],
                            'lusi' => $ax[2],
                            'pakan' => $ax[3]
                        );
                        $this->detail_patrun_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;

        echo json_encode(array("status" => TRUE));
    }

    public function delete($id)
    {
        $datay = $this->detail_patrun_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_patrun_model->delete($rw['id']);
        endforeach;

        $this->patrun_model->delete($id);
        echo json_encode(array("status" => TRUE));
    }

    public function combo_tambah_benang(){
        $and_or = $this->input->get('and_or');
        $order_by = $this->input->get('order_by');
        $page_num= $this->input->get('page_num');
        $per_page= $this->input->get('per_page');
        $q_word= $this->input->get('q_word');
        $search_field= $this->input->get('search_field');

        $datanya = $this->patrun_model->combo_tambah_benang($and_or,$order_by,$page_num,$per_page,$q_word,$search_field);
        echo json_encode($datanya);
    }


}