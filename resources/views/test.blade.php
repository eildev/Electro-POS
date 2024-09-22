@extends('master')
@section('title', '| Product List')
@section('admin')

<link rel="stylesheet" href="//cdn.datatables.net/2.1.6/css/dataTables.dataTables.min.css">

<div class="row">
    <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">

                <div class="table-responsive">
                    <table id="myTable" class="display">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.datatables.net/2.1.6/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
    $('#myTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '{!! route('product.test.view') !!}',
            dataSrc: 'data',
            error: function(xhr, error, thrown) {
                console.error('Error:', error);
                console.error('Thrown:', thrown);
            }
        },
        columns: [
            { data: 'id', name: 'id' },
            { data: 'name', name: 'name' }
        ]
    });
});

</script>


@endsection
