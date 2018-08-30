<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Monitoring_ikt_model extends MY_Model
{
    public $table = 'monitoring_ikt';
    public $primary_key = 'id';
    public $column_order = array(null, 'id','no_kik','warping','jml_warping','sizing','jml_sizing','mutasi_beam','jml_mutasi_beam',null);
    public $column_search = array('id','no_kik','warping','jml_warping','sizing','jml_sizing','mutasi_beam','jml_mutasi_beam');
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
        $this->db->insert('detail_monitoring_ikt', $data_detail);
        // return $this->db->insert_id();
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

    public function get_detail($id){
        $data = array();
        $this->db->from('detail_monitoring_ikt');
        $this->db->where('id_monitoring_ikt',$id);
        $query = $this->db->get();

        $totaly2 = $query->num_rows();
        if ($totaly2 > 0) {
            foreach ($query->result() as $atributy) {

                $data[] = array(
                    'id' => $atributy->id,
                    'id_monitoring_ikt' => $atributy->id_monitoring_ikt,
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