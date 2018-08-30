
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Data Sizing</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p>
                                <button class="btn btn-primary" onclick="import_sizing()"><i class="glyphicon glyphicon-import"></i> Import DBF</button>
                                <!-- <a class="btn btn-primary" href="<?php echo base_url('admin/transaksi/sizing/import'); ?>"><i class="glyphicon glyphicon-import"></i> Import DBF</a> -->
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </p>

                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>tgl_inp</th>
                                    <th>prs_date</th>
                                    <th>btau</th>
                                    <th>tgl_btau</th>
                                    <th>no_btau</th>
                                    <th>no_kik</th>
                                    <th>no_patrun</th>
                                    <th>kode_prod</th>
                                    <th>pjg_bng</th>
                                    <th>jml_bng</th>
                                    <th>brt_bng</th>
                                    <th>brt_bngx</th>
                                    <th>bef_kanji</th>
                                    <th>aft_kanji</th>
                                    <th>bngkr_stfn</th>
                                    <th>bongkar_lm</th>
                                    <th>cucuk_stfn</th>
                                    <th>cucuk_lm</th>
                                    <th>kode_pbl1</th>
                                    <th>kode_pbl2</th>
                                    <th>kode_pbl3</th>
                                    <th>pbl1_stfn</th>
                                    <th>pbl1_lm</th>
                                    <th>pbl2_stfn</th>
                                    <th>pbl2_lm</th>
                                    <th>pbl3_stfn</th>
                                    <th>pbl3_lm</th>
                                    <th>kode_msn</th>
                                    <th>op_code1</th>
                                    <th>op_sft1</th>
                                    <th>op_grp1</th>
                                    <th>op_code2</th>
                                    <th>op_sft2</th>
                                    <th>op_grp2</th>
                                    <th>op_code3</th>
                                    <th>op_sft3</th>
                                    <th>op_grp3</th>
                                    <th>op_code4</th>
                                    <th>op_sft4</th>
                                    <th>op_grp4</th>
                                    <th>no_bng</th>
                                    <th>no_beam</th>
                                    <th>produksi</th>
                                    <th>wkt_stfn</th>
                                    <th>wkt_lm</th>
                                    <th>speed</th>
                                    <th>dryroom</th>
                                    <th>sizebox</th>
                                    <th>pressroll</th>
                                    <th>visco_123</th>
                                    <th>konsen_123</th>
                                    <th>bruto</th>
                                    <th>kosong</th>
                                    <th>netto</th>
                                    <th>pjg_100</th>
                                    <th>pjg_scr</th>
                                    <th>brt_100</th>
                                    <th>brt_scr</th>
                                    <th>lapping_hl</th>
                                    <th>lapping_sc</th>
                                    <th>ambrol_hl</th>
                                    <th>ambrol_sc</th>
                                    <th>corak_100</th>
                                    <th>corak_sc</th>
                                    <th>total_sc</th>
                                    <th>total_grd</th>
                                    <th>netto_warp</th>
                                    <th>no_skir</th>
                                    <th>sisa</th>
                                    <th>a</th>
                                    <th>b</th>
                                    <th>c</th>
                                    <th>n</th>
                                    <th>flag</th>
                                    <th>cek</th>
                                    <th>tgl_cek</th>
                                    <th>password</th>
                                    <th>entry</th>
                                    <th>status</th>
                                    <th>cek1</th>
                                    <th>tgl_cek1</th>
                                    <th>password1</th>
                                    <th>krm</th>
                                    <th>tgl_krm</th>
                                    <th>tujuan</th>
                                    <th>no_sj</th>
                                    <th>keterangan</th>
                                    <th>no_kend</th>
                                    <th>kendaraan</th>
                                    <th>gramasi</th>
                                    <th>spu</th>
                                    <th>kg_teori</th>
                                    <th>std</th>
                                    <th>jns_beam</th>
                                    <th>tgl_retur</th>
                                    <th>no_retur</th>
                                    <th>id_retur</th>
                                    <th>id_gabung</th>
                                    <th>tgl_trm</th>
                                    <th>xwaste</th>
                                    <th>xsize_mr</th>
                                    <th>xnon_size</th>
                                    <th>xspu</th>
                                    <th>tmp_size</th>
                                    <th>tmp_non</th>
                                    <th>tmp_spu</th>
                                    <th>cetak</th>
                                    <!-- <th>Action</th> -->
                                </tr>
                                </thead>


                            </table>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->



<script type="text/javascript">

var save_method; //for save method string
var save_method_detail; //for save method string
var table;
var table_detail;
var iterasi = 0;

$(document).ready(function() {
    //datatables
    table = $('#datatable-responsive').DataTable({
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": "<?php echo site_url('admin/transaksi/sizing/get_data_all');?>",
            "type": "POST"
        },
        buttons: [
            {
                extend: "copy",
                className: "btn-sm"
            },
            {
                extend: "csv",
                className: "btn-sm"
            },
            {
                extend: "excel",
                className: "btn-sm"
            },
            {
                extend: "pdfHtml5",
                className: "btn-sm"
            },
            {
                extend: "print",
                className: "btn-sm"
            },
        ],
        responsive: true,

        //Set column definition initialisation properties.
        "columnDefs": [
            {
                "targets": [ -1 ], //last column
                "orderable": false
            }
        ]
    });

    // Matikan kalau tidak ada detail. 
    /*table_detail = $('#datatable-detail').DataTable({
        "processing": true, //Feature control the processing indicator.
        "serverSide": false, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
        responsive: true,
        columns: [
            { title: "Id" },
            { title: "Sizing" },
            { title: "Action" , width:'25'}
        ],
        "columnDefs": [
            {
                "targets": [ -1 ], //last column
                "orderable": false
            },{
                "targets": [0],
                "visible": false
            }
        ]
    });*/

    table_detail = $('#datatable-detail').DataTable({
        "processing": true, //Feature control the processing indicator.
        "serverSide": false, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
        responsive: true,
        columns: [
            { title: "Id" },
            { title: "No. Patrun" },
            { title: "Motif" },
            { title: "Lusi" },
            { title: "Pakan" }
        ],
        "columnDefs": [
            {
                "targets": [0],
                "visible": false
            }
        ]
    });

    //datepicker
    $('.datepicker').datepicker({
        autoclose: true,
        todayHighlight: true,
        orientation: "top auto",
        todayBtn: true
    });


});

function import_sizing()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    /*table_detail.clear().draw();*/
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Import Sizing'); // Set Title to Bootstrap modal title
}

function add_sizing()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    /*table_detail.clear().draw();*/
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Sizing'); // Set Title to Bootstrap modal title
}

// Matikan Kalau tidak ada detail
/* function add_Detailsizing()
{
    save_method_detail = 'add';
    $('#formDetail')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_formDetail').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Detail Sizing'); // Set Title to Bootstrap modal title
}*/

function detail_sizing(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : "<?php echo site_url('admin/transaksi/sizing/detail/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            table_detail.clear().draw();
            for(var i = 0; i < data[0]['detailSizing'].length; i++) {
                var obj = data[0]['detailSizing'][i];
                table_detail.row.add([obj.id, obj.nomor_patrun, obj.motif, obj.lusi, obj.pakan]).draw();
            }

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Detail IKT'); // Set title to Bootstrap modal title

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_sizing(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : "<?php echo site_url('admin/transaksi/sizing/edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="id"]').val(data[0]['id']);
            $('[name="nomor_kik"]').val(data[0]['nomor_kik']);
            $('[name="tanggal_kik"]').val(data[0]['tanggal_kik']);
            $('[name="kode_produk"]').val(data[0]['kode_produk']);
            $('[name="panjang"]').val(data[0]['panjang']);
            $('[name="jumlah_benang"]').val(data[0]['jumlah_benang']);
            
            // Matikan Kalau tidak ada detail.
            /*table_detail.clear().draw();
            for(var i = 0; i < data[0]['detailSizing'].length; i++) {
                var obj = data[0]['detailSizing'][i];
                table_detail.row.add([obj.id, obj.sizing, obj.action]).draw();
            }*/

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Ubah Sizing'); // Set title to Bootstrap modal title

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function reload_table()
{
    table.ajax.reload(null,false); //reload datatable ajax
}

function save()
{

    var url;

    if(save_method === 'add') {
        url = "<?php echo site_url('admin/transaksi/sizing/import')?>";
    } else {
        url = "<?php echo site_url('admin/transaksi/sizing/update')?>";
    }

    seen = [];
    
    
    // Matikan kalau tidak ada Detail
    /*json = JSON.stringify(table_detail .rows().data(), function(key, val) {
        if (typeof val === "object") {
            if (seen.indexOf(val) >= 0)
                return
                seen.push(val)
        }
        return val
    });*/
    if(!$("#form").validationEngine('validate')){
        return false;
    }

    $('#btnSave').text('menyimpan...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable

    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        // Matikan kalau tidak ada detail
        //data: $('#form').serialize() + "&dataDetail=" + json,
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {

            if(data.status) //if success close modal and reload ajax table
            {
                $('#modal_form').modal('hide');
                reload_table();
            }

            $('#btnSave').text('import'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable


        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
            $('#btnSave').text('import'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable

        }
    });


}

/*function saveDetail()
{
    $('#btnSaveDetail').text('menyimpan...'); //change button text
    $('#btnSaveDetail').attr('disabled',true); //set button disable
    var url;

    if(save_method_detail === 'add') {

        var dd =  $('#formDetail').serialize();
        var nama_sizing =   $('#modal_formDetail').find('[name="nama_sizing"]').val();
        var aksi = "<a class='btn btn-sm btn-danger' href='javascript:void(0)' title='Hapus' onclick='hapus_dataDetail()'><i class='glyphicon glyphicon-trash'></i> Delete</a>";

        iterasi++;
        table_detail.row.add(['', nama_sizing, aksi]).draw();

        $('#modal_formDetail').modal('hide');
        $('#btnSaveDetail').text('simpan'); //change button text
        $('#btnSaveDetail').attr('disabled',false); //set button enable

    } else {

    }
}*/

/*function hapus_dataDetail() {
    $('#datatable-detail').on( 'click', 'tbody tr', function () {
        table_detail.row( this ).remove().draw();
    } );
}*/

function delete_sizing(id)
{
    if(confirm('Anda yakin mau menghapus data ini ?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/sizing/delete')?>/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });

    }
}

function upperCaseF(a){
    setTimeout(function(){
        a.value = a.value.toUpperCase();
    }, 1);
}

</script>
<!-- Detail IKT Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog" style="overflow-y: auto !important;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Masukkan Tanggal Sizing</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Tanggal Sizing <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input placeholder="mm/dd/yyyy" name="tanggal" class="validate[required] form-control datepicker" type="text" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>

               <!-- <p>
                    <a href="javascript:void(0)" class="btn btn-success" onclick="add_Detailbarang();"><i class="glyphicon glyphicon-plus"></i> Tambah Barang</a>
                </p>

                <table id="datatable-detail" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Barang</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                </table>-->

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Import</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<!-- Bootstrap modal -->
<!--<div class="modal fade" id="modal_formDetail" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Form Detail Sizing</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="formDetail" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Nama Sizing</label>
                            <div class="col-md-9">
                                <input name="nama_sizing" placeholder="Nama Sizing" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSaveDetail" onclick="saveDetail()" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
            </div>
        </div>
    </div>
</div>-->
<!-- End Bootstrap modal -->