<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sizing_model extends MY_Model
{
    public $table = 'sizing';
    public $primary_key = 'id';
    public $column_order = array(null, 'id','tgl_inp','prs_date','btau','tgl_btau','no_btau','no_kik','no_patrun','kode_prod','pjg_bng','jml_bng','brt_bng','brt_bngx','bef_kanji','aft_kanji','bngkr_stfn','bongkar_lm','cucuk_stfn','cucuk_lm','kode_pbl1','kode_pbl2','kode_pbl3','pbl1_stfn','pbl1_lm','pbl2_stfn','pbl2_lm','pbl3_stfn','pbl3_lm','kode_msn','op_code1','op_sft1','op_grp1','op_code2','op_sft2','op_grp2','op_code3','op_sft3','op_grp3','op_code4','op_sft4','op_grp4','no_bng','no_beam','produksi','wkt_stfn','wkt_lm','speed','dryroom','sizebox','pressroll','visco_123','konsen_123','bruto','kosong','netto','pjg_100','pjg_scr','brt_100','brt_scr','lapping_hl','lapping_sc','ambrol_hl','ambrol_sc','corak_100','corak_sc','total_sc','total_grd','netto_warp','no_skir','sisa','a','b','c','n','flag','cek','tgl_cek','password','entry','status','cek1','tgl_cek1','password1','krm','tgl_krm','tujuan','no_sj','keterangan','no_kend','kendaraan','gramasi','spu','kg_teori','std','jns_beam','tgl_retur','no_retur','id_retur','id_gabung','tgl_trm','xwaste','xsize_mr','xnone_size','xspu','tmp_size','tmp_non','tmp_spu','cetak',null);
    public $column_search = array('id','tgl_inp','prs_date','btau','tgl_btau','no_btau','no_kik','no_patrun','kode_prod','pjg_bng','jml_bng','brt_bng','brt_bngx','bef_kanji','aft_kanji','bngkr_stfn','bongkar_lm','cucuk_stfn','cucuk_lm','kode_pbl1','kode_pbl2','kode_pbl3','pbl1_stfn','pbl1_lm','pbl2_stfn','pbl2_lm','pbl3_stfn','pbl3_lm','kode_msn','op_code1','op_sft1','op_grp1','op_code2','op_sft2','op_grp2','op_code3','op_sft3','op_grp3','op_code4','op_sft4','op_grp4','no_bng','no_beam','produksi','wkt_stfn','wkt_lm','speed','dryroom','sizebox','pressroll','visco_123','konsen_123','bruto','kosong','netto','pjg_100','pjg_scr','brt_100','brt_scr','lapping_hl','lapping_sc','ambrol_hl','ambrol_sc','corak_100','corak_sc','total_sc','total_grd','netto_warp','no_skir','sisa','a','b','c','n','flag','cek','tgl_cek','password','entry','status','cek1','tgl_cek1','password1','krm','tgl_krm','tujuan','no_sj','keterangan','no_kend','kendaraan','gramasi','spu','kg_teori','std','jns_beam','tgl_retur','no_retur','id_retur','id_gabung','tgl_trm','xwaste','xsize_mr','xnone_size','xspu','tmp_size','tmp_non','tmp_spu','cetak');
    public $order = array('id' => 'desc'); // default order

    public function __construct()
    {
        parent::__construct();
    }

    private function _get_datatables_query()
    {
        $this->db->from($this->table);
        $i = 0;
        foreach ($this->column_search as $item) // loop column
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                if($i===0) // first loop
                {
                    $this->db->group_start();
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }

                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }

        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        }
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }

    function get_datatables()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }

    function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all()
    {
        $this->db->select($this->primary_key);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    public function reset_table()
    {
        $this->db->empty_table($this->table);
    }

    public function save($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }

    public function save_detail($data_detail)
    {
        $this->db->insert('detail_sizing', $data_detail);
        // return $this->db->insert_id();
    }

    public function update_monitoring($no_kik, $sizing, $jml)
    {
        $this->db->where('no_kik', $no_kik);
        $this->db->update('monitoring_ikt', array('sizing' => $sizing, 'jml_sizing' => $jml));
    }

    public function update_by_id($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }

    public function delete_by_id($id)
    {
        $this->db->where($this->primary_key, $id);
        $this->db->delete($this->table);
    }

    public function delete_by_tgl($tanggal)
    {
        $this->db->where('prs_date', $tanggal);
        $this->db->delete($this->table);
    }

    public function get_detail($id){
        $data = array();
        $this->db->from('detail_sizing');
        $this->db->where('id_sizing',$id);
        $query = $this->db->get();

        $totaly2 = $query->num_rows();
        if ($totaly2 > 0) {
            foreach ($query->result() as $atributy) {

                $data[] = array(
                    'id' => $atributy->id,
                    'id_sizing' => $atributy->id_sizing,
                    'nomor_patrun' => $atributy->nomor_patrun,
                    'motif' => $atributy->motif,
                    'lusi' => $atributy->lusi,
                    'pakan' => $atributy->pakan
                );
            }

        }
        return $data;

    }

}