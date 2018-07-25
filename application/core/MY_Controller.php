<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property  ion_auth $ion_auth
 * @property  menu_model $menu_model
 * @property  section_model $section_model
 * @property  groups_model $groups_model
 */
class MY_Controller extends CI_Controller
{
    protected $data = array();
	protected $data_content = array();
	function __construct()
	{
		parent::__construct();
        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->model('menu/section_model');
        $this->load->model('menu/menu_model');
        $this->load->model('menu/groups_model');
        $this->data['site_title'] = $this->config->item("site_title");
        $this->data['site_dev'] = $this->config->item("site_dev");
        $this->data['site_description'] = $this->config->item("site_description");
        $this->data['copyright'] = $this->config->item("copyright");
        $this->data['credit'] = $this->config->item("credit");
        $this->data['menu_data'] = array('master' =>false,'transaksi'=>false,'dashboard'=>false,'cetakan'=>false);
	}



    function html_ordered_menu($array,$parent_id = 0,$group_id,$section,$nama_group)
    {

        $menu_html = '<ul class="nav child_menu">';

        if(!empty($array)){
            foreach($array as $element)
            {
                if($element->parent_id==$parent_id)
                {
                    $menu_html .= '<li><a href="'.site_url($nama_group."/".$element->url).'"> <i class="'.$element->icons.'"></i> '.$element->nama_menu.'</a>';
                    $sub_menus= $this->menu_model->order_by(array('urutan'=>'ASC'))->get_all(array('parent_id'=>$element->id,'group_id'=>$group_id,'section'=>$section,'status'=>'AKTIF'));
                    if(!empty($sub_menus)){
                        $menu_html .= '<ul class="nav child_menu">';
                        foreach($sub_menus as $x)
                        {
                            $menu_html .= '<li><a href="'.site_url($nama_group."/".$x->url).'"> <i class="'.$x->icons.'"></i> '.$x->nama_menu.'</a>';

                            $sub_menus2= $this->menu_model->order_by(array('urutan'=>'ASC'))->get_all(array('parent_id'=>$x->id,'group_id'=>$group_id,'section'=>$section,'status'=>'AKTIF'));
                            if(!empty($sub_menus2)){
                                $menu_html .= '<ul class="nav child_menu">';
                                foreach($sub_menus2 as $y)
                                {
                                    $menu_html .= '<li><a href="'.site_url($nama_group."/".$y->url).'"> <i class="'.$y->icons.'"></i>  '.$y->nama_menu.'</a>';
                                }
                                $menu_html .= '</ul>';
                            }

                            $menu_html .= '</li>';
                        }
                        $menu_html .= '</ul>';
                    }

                    $menu_html .= '</li>';
                }
            }
        }else{
            $menu_html .= '<li>Tidak ada menu';
            $menu_html .= '</li>';
        }

        $menu_html .= '</ul>';
        return $menu_html;
    }

	protected function render($the_view = NULL, $template = 'admin')
	{
		if($template == 'json' || $this->input->is_ajax_request())
		{
			header('Content-Type: application/json');
			echo json_encode($this->data);
		}
		elseif(is_null($template))
		{
			$this->load->view($the_view,$this->data);
		}
		else
		{
			$this->data['the_view_content'] = (is_null($the_view)) ? '' : $this->load->view($the_view, $this->data, TRUE);
			$this->load->view('templates/' . $template . '_view', $this->data);
		}
	}

    function get_nama_bulan_id($a) {
        if ($a == 1)
            $b = 'Januari';
        elseif ($a == 2)
            $b = 'Pebruari';
        elseif ($a == 3)
            $b = 'Maret';
        elseif ($a == 4)
            $b = 'April';
        elseif ($a == 5)
            $b = 'Mei';
        elseif ($a == 6)
            $b = 'Juni';
        elseif ($a == 7)
            $b = 'Juli';
        elseif ($a == 8)
            $b = 'Agustus';
        elseif ($a == 9)
            $b = 'September';
        elseif ($a == 10)
            $b = 'Oktober';
        elseif ($a == 11)
            $b = 'Nopember';
        else
            $b = 'Desember';
        return $b;
    }

    function terbilang($x)
    {
        $bil = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
        if ($x < 12)
            return " " . $bil[$x];
        elseif ($x < 20)
            return $this->terbilang($x - 10) . " belas";
        elseif ($x < 100)
            return $this->terbilang($x / 10) . " puluh" . $this->terbilang($x % 10);
        elseif ($x < 200)
            return " seratus" . $this->terbilang($x - 100);
        elseif ($x < 1000)
            return $this->terbilang($x / 100) . " ratus" . $this->terbilang($x % 100);
        elseif ($x < 2000)
            return " seribu" . $this->terbilang($x - 1000);
        elseif ($x < 1000000)
            return $this->terbilang($x / 1000) . " ribu" . $this->terbilang($x % 1000);
        elseif ($x < 1000000000)
            return $this->terbilang($x / 1000000) . " juta" . $this->terbilang($x % 1000000);
        else
            return " " . $bil[$x];
    }

    function get_nm_hr($a) {
	    $b ="";

        if ($a == 'Wed')
            $b = 'RB';
        elseif ($a == 'Thu')
            $b = 'KM';
        elseif ($a == 'Fri')
            $b = 'JM';
        elseif ($a == 'Sat')
            $b = 'SB';
        elseif ($a == 'Sun')
            $b = 'MG';
        elseif ($a == 'Mon')
            $b = 'SN';
        elseif ($a == 'Tue')
            $b = 'SL';
        return $b;
    }

    //Mengubah format tanggal dari database ke format tgl-bln-thn
    function tanggal($tgl){
	    // yyyy-mm-dd
	    if(!empty($tgl)){
            $tgl=explode(" ",$tgl);
            $tgl=explode("-",$tgl[0]);
            return $tgl[1]."/".$tgl[2]."/".$tgl[0];
        }else {
            return "/";
        }
    }

    //Mengubah format tanggal dari format tgl-bln-thn ke database
    function tanggaldb($tgl){
        if(!empty($tgl)){
            // mm/dd/yyyy
            $tgl=explode("/",$tgl);
            return $tgl[2]."-".$tgl[0]."-".$tgl[1];
        }else{
            return "0000-00-00";
        }

    }
}

/**
 * @property  ion_auth $ion_auth
 * @property  section_model $section_model
 * @property  groups_model $groups_model
 */
class Admin_Controller extends MY_Controller
{
	public $data_content = array();
	function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			redirect('auth/login', 'refresh');
		}

        $current_user = $this->ion_auth->user()->row();
        $this->user_id = $current_user->id;
        $current_group = $this->groups_model->get_data($current_user->id);
        $group_id = $current_group->group_id;
        $nama_group = $current_group->name;
		$this->data['current_user'] = $current_user;
		$this->data['current_user_menu'] = '';
		$this->data['username_auth'] = $current_user->username;
		$this->data['firstname_auth'] = $current_user->first_name;
		$this->data['lastname_auth'] = $current_user->last_name;

        // Menu Start
        $html = '<h3>General</h3>';
        $html .= '<ul class="nav side-menu"><li><a href="'.site_url($nama_group.'/dashboard').'"><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a></li>';

        //$data = $this->section_model->order_by(array('urutan'=>'ASC'))->get_all(array('status'=>'AKTIF'));
        $data = $this->section_model->get_data_menu_section($group_id);
        foreach($data as $xx)
        {
            $id_section = $xx->id;
            $nama_section = $xx->nama_section;
            $icons_section = $xx->icons;

            $html .= '<li>';
            $html .= '<a><i class="'.$icons_section.'"></i> '.$nama_section.' <span class="fa fa-chevron-down"></span></a>';

            $data = $this->menu_model->order_by(array('urutan'=>'ASC'))->get_all(array('parent_id'=>0,'group_id'=>$group_id,'section'=>$id_section));
            $html .= $this->html_ordered_menu($data,0,$group_id,$id_section,$nama_group);
            $html .= '</li>';

        }

        $html .= '</ul>';

        $this->data['menu_user_data'] = $html;

        // Menu END

	}
	protected function render($the_view = NULL, $template = 'admin')
	{
		parent::render($the_view, $template);
	}
}

class Public_Controller extends MY_Controller
{
	public $data_content = array();
	public $data_content_blog = array();
    function __construct()
	{
        parent::__construct();
	}

    protected function render($the_view = NULL, $template = 'public')
    {
        //$this->load->library('menus');
        //$this->data['top_menu'] = $this->menus->get_menu('top-menu',$this->current_lang,'bootstrap_menu');
        parent::render($the_view, $template);
    }


}
