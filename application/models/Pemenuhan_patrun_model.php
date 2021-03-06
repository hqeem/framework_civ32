<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pemenuhan_patrun_model extends MY_Model
{
    public $table = 'pemenuhan_patrun';
    public $primary_key = 'id';
    public $column_order = array(null, 'id','tanggal','nomor_do','kode_relasi','nama_relasi',null);
    public $column_search = array('id','tanggal','nomor_do','kode_relasi','nama_relasi');
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

    public function get_by_id($id)
    {
        $this->db->from($this->table);
        $this->db->where($this->primary_key,$id);
        $query = $this->db->get();

        return $query->row();
    }

    public function save($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
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

    public function combo_tambah_patrun($and_or, $order_by, $page_num, $per_page, $q_word,$search_field)
    {
        $data = array();

        $offset   = ($page_num - 1) * $per_page;

        if(!empty($q_word[0])){
            $this->db->like('kode',$q_word[0],'both');
            $this->db->or_like('motif',$q_word[0],'both');
        }

        $this->db->order_by('kode', 'ASC');
        $query = $this->db->get('patrun', $per_page, $offset);
        if(!empty($q_word[0])){ $totaly2 = $query->num_rows();}else{ $totaly2 = $this->db->count_all('patrun'); }

        if ($totaly2 > 0) {
            foreach ($query->result() as $atributy) {

                $data[] = array(
                    'id' => $atributy->id,
                    'kode_patrun' => $atributy->kode,
                    'motif' => $atributy->motif
                );
            }

        }

        return array('cnt_whole'=>$totaly2,'result' => $data);

    }

    public function combo_nomor_do($and_or, $order_by, $page_num, $per_page, $q_word,$search_field)
    {
        $data = array();

        $offset   = ($page_num - 1) * $per_page;

        if(!empty($q_word[0])){
            $this->db->like('nomor_do',$q_word[0],'both');
            $this->db->or_like('kode_relasi',$q_word[0],'both');
            $this->db->or_like('nama_relasi',$q_word[0],'both');
        }

        $this->db->order_by('nomor_do', 'ASC');
        $query = $this->db->get('delivery_order', $per_page, $offset);
        if(!empty($q_word[0])){ $totaly2 = $query->num_rows();}else{ $totaly2 = $this->db->count_all('delivery_order'); }

        if ($totaly2 > 0) {
            foreach ($query->result() as $atributy) {

                $data[] = array(
                    'id' => $atributy->id,
                    'nomor_do' => $atributy->nomor_do,
                    'tanggal_do' => $atributy->tanggal_do,
                    'tanggal_kirim' => $atributy->tanggal_kirim,
                    'kode_relasi' => $atributy->kode_relasi,
                    'nama_relasi' => $atributy->nama_relasi,
                    'jumlah_order' => $atributy->jumlah_order
                );
            }

        }

        return array('cnt_whole'=>$totaly2,'result' => $data);

    }

    public function get_do_by_nomor($no)
    {
        $this->db->from('delivery_order');
        $this->db->where('nomor_do',$no);
        $query = $this->db->get();
        return $query->row();
    }

}