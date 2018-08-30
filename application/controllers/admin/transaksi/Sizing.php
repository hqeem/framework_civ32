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
 * @property  sizing_model $sizing_model
 */
class Sizing extends Admin_Controller
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
        $this->load->model('sizing_model');
    }

    public function index()
    {
        $this->render('admin/transaksi/sizing_view');
    }

    public function get_data_all()
    {

        $list = $this->sizing_model->get_datatables();
        $data = array();
        $no = $this->input->post('start');
        foreach ($list as $dt) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $this->tanggal($dt->tgl_inp);
            $row[] = $this->tanggal($dt->prs_date);
            $row[] = $dt->btau;
            $row[] = $this->tanggal($dt->tgl_btau);
            $row[] = $dt->no_btau;
            $row[] = $dt->no_kik;
            $row[] = $dt->no_patrun;
            $row[] = $dt->kode_prod;
            $row[] = $dt->pjg_bng;
            $row[] = $dt->jml_bng;
            $row[] = $dt->brt_bng;
            $row[] = $dt->brt_bngx;
            $row[] = $dt->bef_kanji;
            $row[] = $dt->aft_kanji;
            $row[] = $dt->bngkr_stfn;
            $row[] = $dt->bongkar_lm;
            $row[] = $dt->cucuk_stfn;
            $row[] = $dt->cucuk_lm;
            $row[] = $dt->kode_pbl1;
            $row[] = $dt->kode_pbl2;
            $row[] = $dt->kode_pbl3;
            $row[] = $dt->pbl1_stfn;
            $row[] = $dt->pbl1_lm;
            $row[] = $dt->pbl2_stfn;
            $row[] = $dt->pbl2_lm;
            $row[] = $dt->pbl3_stfn;
            $row[] = $dt->pbl3_lm;
            $row[] = $dt->kode_msn;
            $row[] = $dt->op_code1;
            $row[] = $dt->op_sft1;
            $row[] = $dt->op_grp1;
            $row[] = $dt->op_code2;
            $row[] = $dt->op_sft2;
            $row[] = $dt->op_grp2;
            $row[] = $dt->op_code3;
            $row[] = $dt->op_sft3;
            $row[] = $dt->op_grp3;
            $row[] = $dt->op_code4;
            $row[] = $dt->op_sft4;
            $row[] = $dt->op_grp4;
            $row[] = $dt->no_bng;
            $row[] = $dt->no_beam;
            $row[] = $dt->produksi;
            $row[] = $dt->wkt_stfn;
            $row[] = $dt->wkt_lm;
            $row[] = $dt->speed;
            $row[] = $dt->dryroom;
            $row[] = $dt->sizebox;
            $row[] = $dt->pressroll;
            $row[] = $dt->visco_123;
            $row[] = $dt->konsen_123;
            $row[] = $dt->bruto;
            $row[] = $dt->kosong;
            $row[] = $dt->netto;
            $row[] = $dt->pjg_100;
            $row[] = $dt->pjg_scr;
            $row[] = $dt->brt_100;
            $row[] = $dt->brt_scr;
            $row[] = $dt->lapping_hl;
            $row[] = $dt->lapping_sc;
            $row[] = $dt->ambrol_hl;
            $row[] = $dt->ambrol_sc;
            $row[] = $dt->corak_100;
            $row[] = $dt->corak_sc;
            $row[] = $dt->total_sc;
            $row[] = $dt->total_grd;
            $row[] = $dt->netto_warp;
            $row[] = $dt->no_skir;
            $row[] = $dt->sisa;
            $row[] = $dt->a;
            $row[] = $dt->b;
            $row[] = $dt->c;
            $row[] = $dt->n;
            $row[] = $dt->flag;
            $row[] = $dt->cek;
            $row[] = $this->tanggal($dt->tgl_cek);
            $row[] = $dt->password;
            $row[] = $dt->entry;
            $row[] = $dt->status;
            $row[] = $this->tanggal($dt->cek1);
            $row[] = $dt->tgl_cek1;
            $row[] = $dt->password1;
            $row[] = $dt->krm;
            $row[] = $this->tanggal($dt->tgl_krm);
            $row[] = $dt->tujuan;
            $row[] = $dt->no_sj;
            $row[] = $dt->keterangan;
            $row[] = $dt->no_kend;
            $row[] = $dt->kendaraan;
            $row[] = $dt->gramasi;
            $row[] = $dt->spu;
            $row[] = $dt->kg_teori;
            $row[] = $dt->std;
            $row[] = $dt->jns_beam;
            $row[] = $this->tanggal($dt->tgl_retur);
            $row[] = $dt->no_retur;
            $row[] = $dt->id_retur;
            $row[] = $dt->id_gabung;
            $row[] = $this->tanggal($dt->tgl_trm);
            $row[] = $dt->xwaste;
            $row[] = $dt->xsize_mr;
            $row[] = $dt->xnon_size;
            $row[] = $dt->xspu;
            $row[] = $dt->tmp_size;
            $row[] = $dt->tmp_non;
            $row[] = $dt->tmp_spu;
            $row[] = $dt->cetak;
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Detail" onclick="detail_sizing(' . "'" . $dt->id . "'" . ')"><i class="glyphicon glyphicon-list"></i> Detail</a>';
            $data[] = $row;
        }

        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->sizing_model->count_all(),
            "recordsFiltered" => $this->sizing_model->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function edit($id)
    {
        $data = $this->sizing_model->get($id);
        $data = array(
            'id' => $data->id,
            'nomor_kik' => $data->nomor_kik,
            'tanggal_kik' => $this->tanggal($data->tanggal_kik),
            'kode_produk' => $data->kode_produk,
            'panjang' => $data->panjang,
            'jumlah_benang' => $data->jumlah_benang,
            'detailSizing' => (array)null
        );
        echo json_encode(array($data));
    }

    public function detail($id)
    {
        $data = $this->sizing_model->get($id);
        $data = array(
            'detailSizing' => (array)$this->sizing_model->get_detail($id)
        );
        echo json_encode(array($data));
    }

    public function import()
    {
        //seluruh isi dalam tabel akan dihapus sebelum insert
        // $this->sizing_model->reset_table();
        $current_no_kik = '';
        $jml = 0;
        
        $datax  = $this->input->post('dataDetail');
        $json = json_decode($datax);
        
        $tgl = $this->input->post('tanggal');
        $tgl = explode("/",$tgl);
        $tanggal = $tgl[2].$tgl[0].$tgl[1];
        
        $this->sizing_model->delete_by_tgl($tanggal);

        $table = new Table('D:/sizing.dbf');
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

                $insert = $this->sizing_model->save($data);
                $id = $this->db->insert_id();
            
                $this->sizing_model->update_monitoring($data['no_kik'], $data['prs_date'], $jml);
            }
            
            // if ($this->sizing_model->check_similar_item($data) == false) {
            //     $insert = $this->sizing_model->save($data);
            //     $id = $this->db->insert_id();
            // }
            
            // echo '<pre>'; print_r($data); echo '</pre>';
        }

        // redirect('admin/transaksi/sizing', 'refresh');
        
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
        $this->sizing_model->update_by_id(array('id' => $this->input->post('id')), $data);

        // Matikan kalau tidak ada Detail.

        /*$datay = $this->detail_sizing_model->getDataByTransaksi($this->input->post('id'));
        foreach ($datay as $rw) :
            $this->detail_sizing_model->delete($rw['id']);
        endforeach;

        $i=0;
        foreach ($json as $ax) :
            if(!is_object($ax)){
                if(is_string($ax[0])){
                        $data_detail = array(
                            'id_sizing' => $this->input->post('id'),
                            'sizing' => $ax[1]
                        );
                        $this->detail_sizing_model->insert($data_detail);
                }
            }
            $i++;
        endforeach;*/

        echo json_encode(array("status" => true));
    }

    public function delete($id)
    {
        // Matikan kalau tidak ada detail
        /*$datay = $this->detail_sizing_model->getDataByTransaksi($id);
        foreach ($datay as $rw) :
            $this->detail_sizing_model->delete($rw['id']);
        endforeach;*/

        $this->sizing_model->delete($id);
        echo json_encode(array("status" => true));
    }


}