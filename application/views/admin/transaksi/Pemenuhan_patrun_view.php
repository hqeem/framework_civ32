
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Data Pemenuhan Patrun</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p>
                                <button class="btn btn-success" onclick="add_pemenuhan_patrun()"><i class="glyphicon glyphicon-plus"></i> Tambah Pemenuhan Patrun</button>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </p>


                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <!-- <th>Id</th> -->
                                    <th>Tanggal</th>
                                    <th>No. DO</th>
                                    <th>Kode Relasi</th>
                                    <th>Nama Relasi</th>
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
                "url": "<?php echo site_url('admin/transaksi/pemenuhan_patrun/get_data_all');?>",
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

        table_detail = $('#datatable-detail').DataTable({
            "processing": true, //Feature control the processing indicator.
            "serverSide": false, //Feature control DataTables' server-side processing mode.
            "order": [], //Initial no order.
            responsive: true,
            columns: [
                { title: "Id" },
                { title: "Kode Patrun" },
                { title: "Pakan" },
                { title: "Lusi" },
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
        });

        table_detail_print = $('#datatable-detail-print').DataTable({
            "processing": true, //Feature control the processing indicator.
            "serverSide": false, //Feature control DataTables' server-side processing mode.
            "order": [], //Initial no order.
            responsive: true,
            columns: [
                { title: "Id" },
                { title: "Kode Patrun" },
                { title: "Pakan" },
                { title: "Lusi" }
            ],
            "columnDefs": [
                // {
                //     "targets": [ -1 ], //last column
                //     "orderable": false
                // },
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

    function set_relasi_input(no)
    {
        //Ajax Load data from ajax
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/pemenuhan_patrun/get_do_by_nomor/')?>/" + no,
            type: "GET",
            dataType: "JSON",
            success: function(data)
            {
                $('#kode_relasi').val(data[0]['kode_relasi']);
                $('#nama_relasi').val(data[0]['nama_relasi']);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error get data from ajax');
            }
        });
    }

    function add_pemenuhan_patrun()
    {
        save_method = 'add';
        $('#form')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string
        table_detail.clear().draw();
        $('#modal_form').modal('show'); // show bootstrap modal
        $('.modal-title').text('Tambah Pemenuhan Patrun'); // Set Title to Bootstrap modal title
    }

    function add_Detailpemenuhan_patrun()
    {
        save_method_detail = 'add';
        $('#formDetail')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string
        $('#modal_formDetail').modal('show'); // show bootstrap modal
    }

    function print_pemenuhan_patrun(id)
    {
        save_method = 'update';
        $('#form')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string

        //Ajax Load data from ajax
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/pemenuhan_patrun/edit/')?>/" + id,
            type: "GET",
            dataType: "JSON",
            success: function(data)
            {
                $('[name="id"]').val(data[0]['id']);
                $('[name="tanggal"]').val(data[0]['tanggal']);
                $('[name="nomor_do"]').val(data[0]['nomor_do']);
                $('[name="kode_relasi"]').val(data[0]['kode_relasi']);
                $('[name="nama_relasi"]').val(data[0]['nama_relasi']);
                table_detail_print.clear().draw();
                for(var i = 0; i < data[0]['detailPemenuhan_patrun'].length; i++) {
                    var obj = data[0]['detailPemenuhan_patrun'][i];
                    table_detail_print.row.add([obj.id, obj.kode_patrun, obj.pakan, obj.lusi]).draw();
                }

                $('#modal_form_print').modal('show'); // show bootstrap modal when complete loaded
                $('.modal-title').text('Print Pemenuhan Patrun'); // Set title to Bootstrap modal title

            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error get data from ajax');
            }
        });
    }

    function edit_pemenuhan_patrun(id)
    {
        save_method = 'update';
        $('#form')[0].reset(); // reset form on modals
        $('.form-group').removeClass('has-error'); // clear error class
        $('.help-block').empty(); // clear error string

        //Ajax Load data from ajax
        $.ajax({
            url : "<?php echo site_url('admin/transaksi/pemenuhan_patrun/edit/')?>/" + id,
            type: "GET",
            dataType: "JSON",
            success: function(data)
            {
                $('[name="id"]').val(data[0]['id']);
                $('[name="tanggal"]').val(data[0]['tanggal']);
                $('[name="nomor_do"]').val(data[0]['nomor_do']);
                $('[name="kode_relasi"]').val(data[0]['kode_relasi']);
                $('[name="nama_relasi"]').val(data[0]['nama_relasi']);
                table_detail.clear().draw();
                for(var i = 0; i < data[0]['detailPemenuhan_patrun'].length; i++) {
                    var obj = data[0]['detailPemenuhan_patrun'][i];
                    table_detail.row.add([obj.id, obj.kode_patrun, obj.pakan, obj.lusi, obj.action]).draw();
                }

                $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
                $('.modal-title').text('Edit Pemenuhan Patrun'); // Set title to Bootstrap modal title

            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error get data from ajax');
            }
        });
    }

    function cekData() {
        var data = table_detail .rows().data();
    }

    function reload_table()
    {
        table.ajax.reload(null,false); //reload datatable ajax
    }

    function reload_Detailtable()
    {
        table_detail.ajax.reload(null,false); //reload datatable ajax
    }

    function save()
    {

        var url;

        if(save_method === 'add') {
            url = "<?php echo site_url('admin/transaksi/pemenuhan_patrun/add')?>";
        } else {
            url = "<?php echo site_url('admin/transaksi/pemenuhan_patrun/update')?>";
        }

        seen = [];

        json = JSON.stringify(table_detail .rows().data(), function(key, val) {
            if (typeof val === "object") {
                if (seen.indexOf(val) >= 0)
                    return
                    seen.push(val)
            }
            return val
        });


        if(!$("#form").validationEngine('validate')){
            return false;
        }

        if(!$("#formDetail").validationEngine('validate')){
            return false;
        }

        $('#btnSave').text('menyimpan...'); //change button text
        $('#btnSave').attr('disabled',true); //set button disable

        // ajax adding data to database
        $.ajax({
            url : url,
            type: "POST",
            data: $('#form').serialize() + "&dataDetail=" + json,
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

    function saveDetail()
    {

        var x = document.getElementById("kode_patrun").title;
        if(x==="Attention : Please choose from among the list."){
            $("#kode_patrun").val("");
            return false;
        }

        if(!$("#formDetail").validationEngine('validate')){
            return false;
        }

        $('#btnSaveDetail').text('menyimpan...'); //change button text
        $('#btnSaveDetail').attr('disabled',true); //set button disable

        var url;

        if(save_method_detail === 'add') {

            var dd =  $('#formDetail').serialize();
            var kode_patrun =   $('#modal_formDetail').find('[name="kode_patrun"]').val();
            var pakan =   $('#modal_formDetail').find('[name="pakan"]').val();
            var lusi =   $('#modal_formDetail').find('[name="lusi"]').val();
            var aksi = "<a class='btn btn-sm btn-danger' href='javascript:void(0)' title='Hapus' onclick='hapus_dataDetail()'><i class='glyphicon glyphicon-trash'></i> Delete</a>";

            iterasi++;
            table_detail.row.add(['', kode_patrun, pakan, lusi, aksi]).draw();

            $('#modal_formDetail').modal('hide');
            $('#btnSaveDetail').text('simpan'); //change button text
            $('#btnSaveDetail').attr('disabled',false); //set button enable

        } else {

        }
    }

    function hapus_dataDetail() {
        $('#datatable-detail').on( 'click', 'tbody tr', function () {
            table_detail.row( this ).remove().draw();
        } );
    }

    function delete_pemenuhan_patrun(id)
    {
        if(confirm('Anda yakin mau menghapus data ini ?'))
        {
            // ajax delete data to database
            $.ajax({
                url : "<?php echo site_url('admin/transaksi/pemenuhan_patrun/delete')?>/"+id,
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
                <h3 class="modal-title">Form Pemenuhan Patrun</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Tanggal <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input placeholder="mm/dd/yyyy" name="tanggal" class="validate[required] form-control datepicker" type="text" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">No. DO <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="nomor_do" id="nomor_do" placeholder="Nomor DO" class="validate[required,minSize[1]] form-control" type="text" required="required" data-validate-length-range="6" data-validate-words="2">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Kode Relasi <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="kode_relasi" id="kode_relasi" placeholder="Kode Relasi" class="validate[required,minSize[1]] form-control" type="text" required="required" readonly>
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
                    </div>

                <p>
                    <a href="javascript:void(0)" class="btn btn-success" onclick="add_Detailpemenuhan_patrun();"><i class="glyphicon glyphicon-plus"></i> Tambah Patrun</a>
                </p>

                <table id="datatable-detail" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Kode Patrun</th>
                        <th>Jumlah Pakan</th>
                        <th>Jumlah Lusi</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                </table>

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


<!-- Print Bootstrap modal -->
<div class="modal fade" id="modal_form_print" role="dialog" style="overflow-y: auto !important;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Detail Pemenuhan Patrun</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Tanggal <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input placeholder="mm/dd/yyyy" name="tanggal" class="validate[required] form-control" type="text" required="required" readonly>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">No. DO <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="nomor_do" placeholder="Nomor DO" class="validate[required,minSize[1]] form-control" type="text" required="required" data-validate-length-range="6" data-validate-words="2" readonly>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Kode Relasi <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="kode_relasi" id="kode_relasi" placeholder="Kode Relasi" class="validate[required,minSize[1]] form-control" type="text" required="required" readonly>
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
                    </div>

                <table id="datatable-detail-print" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Kode Patrun</th>
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
<div class="modal fade" id="modal_formDetail" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3>Form Tambah Patrun</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="formDetail" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Kode Patrun <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="kode_patrun" id="kode_patrun" placeholder="Kode Patrun" class="validate[required] form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Jumlah Pakan <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="pakan" placeholder="Jumlah Pakan" class="validate[required] form-control" type="number" min="1" required="required">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Jumlah Lusi <span class="required">*</span></label>
                            <div class="col-md-9">
                                <input name="lusi" placeholder="Jumlah Lusi" class="validate[required] form-control" type="number" min="1" required="required">
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
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<script>

    $('#kode_patrun').ajaxComboBox(
        '<?php echo site_url('admin/transaksi/pemenuhan_patrun/combo_tambah_patrun/');?>',
        {
            lang: 'en',
            field: 'kode_patrun',
            sub_info: true,
            select_only: true,
            sub_as: {
                kode_patrun: 'Kode Patrun',
                motif: 'Motif'
            },
            bind_to: 'foo',
            primary_key: 'kode_patrun',
            show_field: 'kode_patrun,motif',
            button_img: '<?php echo site_url('assets/ajax.combobox/dist/btn.png');?>'
        }
    )
        .bind('foo', function(e, is_enter_key) {
            if (!is_enter_key) {

                var x = document.getElementById("kode_patrun").title;
                if(x==="Attention : Please choose from among the list."){
                    $("#kode_patrun").val("");
                }
            }
        })
        .keydown(function(e) {
            if(e.keyCode === 13) {
                var x = document.getElementById("kode_patrun").title;
                if(x==="Attention : Please choose from among the list."){
                    $("#kode_patrun").val("");
                }
            }
        });

    $('#nomor_do').ajaxComboBox(
        '<?php echo site_url('admin/transaksi/pemenuhan_patrun/combo_nomor_do/');?>',
        {
            lang: 'en',
            field: 'nomor_do',
            sub_info: true,
            select_only: true,
            sub_as: {
                nomor_do: 'No. DO',
                tanggal_do: 'Tgl. DO',
                tanggal_kirim: 'Tgl. Kirim',
                kode_relasi: 'Kode Relasi',
                nama_relasi: 'Nama Relasi',
                jumlah_order: 'Jml. Order',
            },
            bind_to: 'foo',
            primary_key: 'nomor_do',
            show_field: 'nomor_do,tanggal_do,tanggal_kirim,kode_relasi,nama_relasi,jumlah_order',
            button_img: '<?php echo site_url('assets/ajax.combobox/dist/btn.png');?>'
        }
    )
        .bind('foo', function(e, is_enter_key) {
            if (!is_enter_key) {

                var x = document.getElementById("nomor_do").title;
                if(x==="Attention : Please choose from among the list."){
                    $("#nomor_do").val("");
                }
            }
        })
        .keydown(function(e) {
            if(e.keyCode === 13) {
                var x = document.getElementById("nomor_do").title;
                if(x==="Attention : Please choose from among the list."){
                    $("#nomor_do").val("");
                }
            }
        });

        $('#nomor_do').change(function() {
            set_relasi_input($('#nomor_do').val());
        });

</script>