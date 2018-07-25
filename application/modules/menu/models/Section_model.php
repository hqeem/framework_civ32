<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Section_model extends MY_Model
{
    public $table = 'menu_section';
    public $primary_key = 'id';

    public function __construct()
    {
        parent::__construct();
    }

    function get_data_menu_section($group_id)
    {

        $this->db->select("menu_section.*");
        $this->db->join("menu_section","menu_section.`id`= menus.`section`");
        $this->db->join("groups","groups.`id` = menus.`group_id`");
        $this->db->where("menus.`group_id`",$group_id);
        $this->db->where("menus.`status`","AKTIF");
        $this->db->group_by("menu_section.`id`");
        $this->db->order_by("menu_section.`urutan`","ASC");
        $this->db->from("menus");
        $query = $this->db->get();
        return $query->result();
    }




}