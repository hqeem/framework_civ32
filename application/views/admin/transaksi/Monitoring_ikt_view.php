
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Data Monitoring IKT</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </p>

                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>No. KIK</th>
                                    <th>Warping</th>
                                    <th>Jml. Warping</th>
                                    <th>Sizing</th>
                                    <th>Jml. Sizing</th>
                                    <th>Mutasi Beam</th>
                                    <th>Jml. Mutasi Beam</th>
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
            "url": "<?php echo site_url('admin/transaksi/monitoring_ikt/get_data_all');?>",
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
                // "targets": [ -1 ], //last column
                // "orderable": false
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
            { title: "Monitoring_ikt" },
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

function add_monitoring_ikt()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    /*table_detail.clear().draw();*/
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Monitoring_ikt'); // Set Title to Bootstrap modal title
}

// Matikan Kalau tidak ada detail
/* function add_Detailmonitoring_ikt()
{
    save_method_detail = 'add';
    $('#formDetail')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_formDetail').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Detail Monitoring_ikt'); // Set Title to Bootstrap modal title
}*/

function detail_monitoring_ikt(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : "<?php echo site_url('admin/transaksi/monitoring_ikt/detail/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            table_detail.clear().draw();
            for(var i = 0; i < data[0]['detailMonitoring_ikt'].length; i++) {
                var obj = data[0]['detailMonitoring_ikt'][i];
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

function edit_monitoring_ikt(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : "<?php echo site_url('admin/transaksi/monitoring_ikt/edit/')?>/" + id,
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
            for(var i = 0; i < data[0]['detailMonitoring_ikt'].length; i++) {
                var obj = data[0]['detailMonitoring_ikt'][i];
                table_detail.row.add([obj.id, obj.monitoring_ikt, obj.action]).draw();
            }*/

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Ubah Monitoring_ikt'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('admin/transaksi/monitoring_ikt/add')?>";
    } else {
        url = "<?php echo site_url('admin/transaksi/monitoring_ikt/update')?>";
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

            $('#btnSave').text('simpan'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable


        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data, cek kesamaan Kode Monitoring_ikt');
            $('#btnSave').text('simpan'); //change button text
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
        var nama_monitoring_ikt =   $('#modal_formDetail').find('[name="nama_monitoring_ikt"]').val();
        var aksi = "<a class='btn btn-sm btn-danger' href='javascript:void(0)' title='Hapus' onclick='hapus_dataDetail()'><i class='glyphicon glyphicon-trash'></i> Delete</a>";

        iterasi++;
        table_detail.row.add(['', nama_monitoring_ikt, aksi]).draw();

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

function delete_monitoring_ikt(id)
{
    if(confirm('Anda yakin mau menghapus data ini ?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/monitoring_ikt/delete')?>/"+id,
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
                <h3 class="modal-title">Detail IKT</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <table id="datatable-detail" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>No. Patrun</th>
                            <th>Motif</th>
                            <th>Jumlah Pakan</th>
                            <th>Jumlah Lusi</th>
                        </tr>
                        </thead>
                    </table>
                </form>
            </div>
            <!-- <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
            </div> -->
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
                <h3 class="modal-title">Form Detail Monitoring_ikt</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="formDetail" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Nama Monitoring_ikt</label>
                            <div class="col-md-9">
                                <input name="nama_monitoring_ikt" placeholder="Nama Monitoring_ikt" class="form-control" type="text">
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