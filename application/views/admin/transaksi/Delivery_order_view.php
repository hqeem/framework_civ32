
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Data Delivery Order</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p>
                                <button class="btn btn-success" onclick="add_delivery_order()"><i class="glyphicon glyphicon-plus"></i> Tambah Delivery Order</button>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </p>


                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <!-- <th>Id</th> -->
                                    <th>No. DO</th>
                                    <th>Tanggal DO</th>
                                    <th>Tanggal Kirim</th>
                                    <th>Kode Relasi</th>
                                    <th>Nama Relasi</th>
                                    <th>Jumlah Order (Kodi)</th>
                                    <th>Keterangan</th>
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
                "url": "<?php echo site_url('admin/transaksi/delivery_order/get_data_all');?>",
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
                { title: "Barang" },
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

        //datepicker
        $('.datepicker').datepicker({
            autoclose: true,
            todayHighlight: true,
            orientation: "top auto",
            todayBtn: true
        });


    });



    function add_delivery_order()
    {
        save_method = 'add';
        $('#form')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string
        /*table_detail.clear().draw();*/
        $('#modal_form').modal('show'); // show bootstrap modal
        $('.modal-title').text('Tambah Delivery Order'); // Set Title to Bootstrap modal title
    }

    // Matikan Kalau tidak ada detail
   /* function add_Detailbarang()
    {
        save_method_detail = 'add';
        $('#formDetail')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string
        $('#modal_formDetail').modal('show'); // show bootstrap modal
        $('.modal-title').text('Tambah Detail Barang'); // Set Title to Bootstrap modal title
    }*/

    function set_nama_relasi(kode)
    {
        //Ajax Load data from ajax
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/delivery_order/get_relasi_by_kode/')?>/" + kode,
            type: "GET",
            dataType: "JSON",
            success: function(data)
            {
                $('#nama_relasi').val(data[0]['nama']);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error get data from ajax');
            }
        });
    }

    function edit_delivery_order(id)
    {
        save_method = 'update';
        $('#form')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string

        //Ajax Load data from ajax
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/delivery_order/edit/')?>/" + id,
            type: "GET",
            dataType: "JSON",
            success: function(data)
            {
                $('[name="id"]').val(data[0]['id']);
                $('[name="nomor_do"]').val(data[0]['nomor_do']);
                $('[name="tanggal_do"]').val(data[0]['tanggal_do']);
                $('[name="tanggal_kirim"]').val(data[0]['tanggal_kirim']);
                $('[name="kode_relasi"]').val(data[0]['kode_relasi']);
                $('[name="nama_relasi"]').val(data[0]['nama_relasi']);
                $('[name="jumlah_order"]').val(data[0]['jumlah_order']);
                $('[name="keterangan"]').val(data[0]['keterangan']);
                
                // Matikan Kalau tidak ada detail.
                /*table_detail.clear().draw();
                for(var i = 0; i < data[0]['detailBarang'].length; i++) {
                    var obj = data[0]['detailBarang'][i];
                    table_detail.row.add([obj.id, obj.barang, obj.action]).draw();
                }*/

                $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
                $('.modal-title').text('Ubah Delivery Order'); // Set title to Bootstrap modal title

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
            url = "<?php echo site_url('admin/transaksi/delivery_order/add')?>";
        } else {
            url = "<?php echo site_url('admin/transaksi/delivery_order/update')?>";
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
                alert('Error adding / update data');
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
            var nama_barang =   $('#modal_formDetail').find('[name="nama_barang"]').val();
            var aksi = "<a class='btn btn-sm btn-danger' href='javascript:void(0)' title='Hapus' onclick='hapus_dataDetail()'><i class='glyphicon glyphicon-trash'></i> Delete</a>";

            iterasi++;
            table_detail.row.add(['', nama_barang, aksi]).draw();

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

    function delete_delivery_order(id)
    {
        if(confirm('Anda yakin mau menghapus data ini ?'))
        {
            // ajax delete data to database
            $.ajax({
                url : "<?php echo site_url('admin/transaksi/delivery_order/delete')?>/"+id,
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

</script>

<!-- Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog" style="overflow-y: auto !important;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Form Delivery Order</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">No. DO <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="nomor_do" placeholder="Nomor DO" class="validate[required,minSize[1]] form-control" type="text" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Tanggal DO <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input placeholder="mm/dd/yyyy" name="tanggal_do" class="validate[required] form-control datepicker" type="text" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Tanggal Kirim <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input placeholder="mm/dd/yyyy" name="tanggal_kirim" class="validate[required] form-control datepicker" type="text" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Kode Relasi <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="kode_relasi" id="kode_relasi" placeholder="Jenis Barang" class="validate[required] form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Nama Relasi <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="nama_relasi" id="nama_relasi" placeholder="Nama Relasi" class="validate[required,minSize[3]] form-control" type="text" required="required" readonly>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Jumlah Order (Kodi) <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="jumlah_order" placeholder="Jumlah Order" class="validate[required] form-control" type="number" min="1" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Keterangan <span class="required">*</span></label>
                            <div class="col-md-9">
                                <textarea name="keterangan" placeholder="Keterangan" class="validate[required,minSize[6]] form-control" type="text" required="required"></textarea>
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
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<script>

$('#kode_relasi').ajaxComboBox(
    '<?php echo site_url('admin/transaksi/delivery_order/combo_kode_relasi/');?>',
    {
        lang: 'en',
        field: 'kode',
        sub_info: true,
        select_only: true,
        sub_as: {
            id: 'Id',
            kode: 'Kode',
            nama: 'Nama',
            alamat: 'Alamat'
        },
        bind_to: 'foo',
        primary_key: 'kode',
        show_field: 'id,kode,nama,alamat',
        button_img: '<?php echo site_url('assets/ajax.combobox/dist/btn.png');?>'
    }
)
    .bind('foo', function(e, is_enter_key) {
        if (!is_enter_key) {

            var x = document.getElementById("kode_relasi").title;
            if(x==="Attention : Please choose from among the list."){
                $("#kode_relasi").val("");
            }
        }
    })
    .keydown(function(e) {
        if(e.keyCode === 13) {
            var x = document.getElementById("kode_relasi").title;
            if(x==="Attention : Please choose from among the list."){
                $("#kode_relasi").val("");
            }
        }
    });

$('#kode_relasi').change(function() {
    set_nama_relasi($('#kode_relasi').val());
    // $('#nama_relasi').val($('#kode_relasi').val());
});

</script>



<!-- Bootstrap modal -->
<!--<div class="modal fade" id="modal_formDetail" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Form Detail Barang</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="formDetail" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Nama Barang</label>
                            <div class="col-md-9">
                                <input name="nama_barang" placeholder="Nama Barang" class="form-control" type="text">
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