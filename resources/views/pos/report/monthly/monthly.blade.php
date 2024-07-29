@extends('master')
@section('admin')
    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Monthly Report</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Monthly Report</h6>
                    <div class="table-responsive">
                        <table id="example" class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Date</th>
                                    <th>Total Incoming</th>
                                    <th>Total Outgoing</th>
                                    <th>Balance</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $key = 1;
                                @endphp
                                @foreach ($dailyReports as $report)
                                    <tr>
                                        <td>{{ $key }}</td>
                                        @php
                                            $key++;
                                        @endphp
                                        <td>{{ $report['date'] }}</td>
                                        <td>{{ number_format($report['totalIngoing'], 2) }}</td>
                                        <td>{{ number_format($report['totalOutgoing'], 2) }}</td>
                                        <td>{{ number_format($report['totalBalance'], 2) }}</td>
                                        <td>
                                            <button type="button" class="btn btn-primary view_details">
                                                View Details
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function() {

        });
    </script>
@endsection
