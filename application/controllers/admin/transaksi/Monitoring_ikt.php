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
 * @property  monitoring_ikt_model $monitoring_ikt_model
 */
class Monitoring_ikt extends Admin_Controller
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
        $this->load->model('monitoring_ikt_model');
    }

    public function index()
    {
        $this->render('admin/transaksi/monitoring_ikt_view');
    }

    public function get_data_all()
    {

        $list = $this->monitoring_ikt_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $dt->no_kik;
            $row[] = $this->tanggal($dt->warping);
            $row[] = $dt->jml_warping;
            $row[] = $this->tanggal($dt->sizing);
            $row[] = $dt->jml_sizing;
            $row[] = $this->tanggal($dt->mutasi_beam);
            $row[] = $dt->jml_mutasi_beam;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Detail" onclick="detail_monitoring_ikt(' . "'" . $dt->id . "'" . ')"><i class="glyphicon glyphicon-list"></i> Detail</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->monitoring_ikt_model->count_all(),
            "recordsFiltered" => $this->monitoring_ikt_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->monitoring_ikt_model->get($id);
        $data = array(
            'id' => $data->id,
            'nomor_kik' => $data->nomor_kik,
            'tanggal_kik' => $this->tanggal($data->tanggal_kik),
            'kode_produk' => $data->kode_produk,
            'panjang' => $data->panjang,
            'jumlah_benang' => $data->jumlah_benang,
            'detailMonitoring_ikt' => (array)null
        );
        echo json_encode(array($data));
    }

    public function detail($id)
    {
        $data = $this->monitoring_ikt_model->get($id);
        $data = array(
            'detailMonitoring_ikt' => (array)$this->monitoring_ikt_model->get_detail($id)
        );
        echo json_encode(array($data));
    }

    public function add()
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
        $insert = $this->monitoring_ikt_model->save($data);
        $id = $this->db->insert_id();

        // Matikan Kalau tidak ada detail
        /*if($id){
            $i=0;
            foreach ($json as $ax) :
                if(!is_object($ax)){
                    if(is_string($ax[0])){
                        $data_detail = array(
                            'id_monitoring_ikt' => $id,
                            'monitoring_ikt' => $ax[1]
                        );
                        $this->detail_monitoring_ikt_model->insert($data_detail);
                    }
                }
                $i++;
            endforeach;
        }*/

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
        $this->monitoring_ikt_model->update_by_id(array('id' => $this->input->post('id')), $data);

        // Matikan kalau tidak ada Detail.

        /*$datay = $this->detail_monitoring_ikt_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_monitoring_ikt_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_monitoring_ikt' => $this->input->post('id'),
                            'monitoring_ikt' => $ax[1]
                        );
                        $this->detail_monitoring_ikt_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;*/

        echo json_encode(array("status" => true));
    }

    public function delete($id)
    {
        // Matikan kalau tidak ada detail
        /*$datay = $this->detail_monitoring_ikt_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_monitoring_ikt_model->delete($rw['id']);
        endforeach;*/

        $this->monitoring_ikt_model->delete($id);
        echo json_encode(array("status" => true));
    }


}