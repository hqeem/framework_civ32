<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Groups_model extends MY_Model
{
    public $table = 'users_groups';
    public $primary_key = 'id';

    public function __construct()
    {
        parent::__construct();
    }

    public function get_data($user_id)
    {

        $this->db->select("users_groups.group_id , groups.name");
        $this->db->from($this->table);
        $this->db->join("groups","groups.id=users_groups.group_id");
        $this->db->where("users_groups.user_id",$user_id);
        $query = $this->db->get();

        return $query->row();
    }




}