<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Detail_patrun_model extends MY_Model
{
    public $table = 'detail_patrun';
    public $primary_key = 'id';
    public function __construct()
    {
        parent::__construct();

    }

    public function getDataByTransaksi($id){
        $data = array();
        $this->db->where('id_patrun',$id);
        $query = $this->db->get($this->table);

        $totaly2 = $query->num_rows();
        if ($totaly2 > 0) {
            foreach ($query->result() as $atributy) {

                $data[] = array(
                    'id' => $atributy->id,
                    'id_patrun' => $atributy->id_patrun,
                    'nama_benang' => $atributy->nama_benang,
                    'lusi' => $atributy->lusi,
                    'pakan' => $atributy->pakan,
                    'action' => "<a class='btn btn-sm btn-danger' href='javascript:void(0)' title='Hapus' onclick='hapus_dataDetail()'><i class='glyphicon glyphicon-trash'></i> Delete</a>"
                );
            }

        }
        return $data;

    }

    public function update_by_id($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }



}