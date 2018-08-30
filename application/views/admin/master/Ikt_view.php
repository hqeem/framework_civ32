
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Data IKT</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p>
                                <button class="btn btn-primary" onclick="import_ikt()"><i class="glyphicon glyphicon-import"></i> Import DBF</button>
                                <!-- <a class="btn btn-primary" href="<?php echo base_url('admin/master/ikt/import'); ?>"><i class="glyphicon glyphicon-import"></i> Import DBF</a> -->
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </p>

                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>no_kik</th>
                                    <th>tgl_kik</th>
                                    <th>kode_prod</th>
                                    <th>pjg</th>
                                    <th>jml_bng</th>
                                    <th>no_patrun</th>
                                    <th>motif</th>
                                    <th>Action</th>
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
            "url": "<?php echo site_url('admin/master/ikt/get_data_all');?>",
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
            { title: "Ikt" },
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
            { title: "Pakan" },
            { title: "Sulur" },
            { title: "Tumpal" }
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

function import_ikt()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    /*table_detail.clear().draw();*/
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Import Ikt'); // Set Title to Bootstrap modal title
}

function detail_ikt(id)
{
    // save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : "<?php echo site_url('admin/master/ikt/detail/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            table_detail.clear().draw();
            for(var i = 0; i < data[0]['detailIkt'].length; i++) {
                var obj = data[0]['detailIkt'][i];
                table_detail.row.add([obj.id, obj.no_patrun, obj.motif, obj.lusi, obj.pakan, obj.sulur, obj.tumpal]).draw();
            }

            $('#modal_form_detail').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Detail IKT'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('admin/master/ikt/import')?>";
    } else {
        url = "<?php echo site_url('admin/master/ikt/update')?>";
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

function upperCaseF(a){
    setTimeout(function(){
        a.value = a.value.toUpperCase();
    }, 1);
}

</script>
<!-- Import IKT Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog" style="overflow-y: auto !important;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Masukkan Tanggal IKT</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Tgl. IKT <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input placeholder="mm/dd/yyyy" name="tanggal" class="validate[required] form-control datepicker" type="text" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
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

<!-- Detail IKT Bootstrap modal -->
<div class="modal fade" id="modal_form_detail" role="dialog" style="overflow-y: auto !important;">
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
                            <th>Jumlah Sulur</th>
                            <th>Jumlah Tumpal</th>
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