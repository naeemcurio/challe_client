<?php

namespace App\DataTables;

use App\Models\Challenge;
use App\Models\User;
use Carbon\Carbon;
use Google\Cloud\Storage\Notification;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class NotificationListing extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query Results from query() method.
     */
    public function dataTable(QueryBuilder $query)
    {
        $dataTable = new EloquentDataTable($this->query());


        $dataTable->addIndexColumn()
//            ->addIndexColumn()
            ->addColumn('action', function ($dataTable) {
                $actions = '';

                if ($dataTable->data['type'] == 'challenge_record_submit') {
                    $actions = '<a  href="'.route('on-going-challenge.show',['on_going_challenge'=>$dataTable->data['id']]).'" title="' . __('actions.view') . '"

                                         title="' . __('actions.view') . '" data-bs-toggle="tooltip" data-bs-placement="top">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye" style="color: rgba(58, 170, 53);">
                                  <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                  <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </a>
                    ';
                     }
                elseif($dataTable->data['type'] == 'withdraw_request')
                {
                    $actions = '<a  href="'.route('withdraw.index').'" title="' . __('actions.view') . '"

                                         title="' . __('actions.view') . '" data-bs-toggle="tooltip" data-bs-placement="top">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye" style="color: rgba(58, 170, 53);">
                                  <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                  <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </a>
                    ';
                }


                return $actions;
            })
            ->editColumn('type', function ($dataTable) {
                return str_replace('_',' ',__($dataTable->data['type']));
            })
            ->editColumn('message', function ($dataTable) {
                if(isset($dataTable->data['user_id']))
                {
                    $user = User::find($dataTable->data['user_id']);
                    return $user->full_name.' '.__($dataTable->data['message']);
                }
                else{
                    return 'N/A';
                }

            });


        return $dataTable;
    }

    /**
     * Get the query source of dataTable.
     */
    public function query()
    {
        $notificationsQuery = Auth::user()->notifications()->getQuery();

        return $notificationsQuery->orderBy('created_at', 'desc');

    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('notification-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
//            ->dom('lrtip')
            ->orderBy(1)
            ->selectStyleSingle();
//            ->buttons([
//                Button::make('excel'),
//                Button::make('csv'),
//                Button::make('pdf'),
//                Button::make('print'),
//                Button::make('reset'),
//                Button::make('reload')
//            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns()
    {
//        return [
//            Column::computed('action')
//                  ->exportable(false)
//                  ->printable(false)
//                  ->width(60)
//                  ->addClass('text-center'),
//            Column::make('id'),
//            Column::make('add your columns'),
//            Column::make('created_at'),
//            Column::make('updated_at'),
//        ];

        return [
            Column::computed('DT_RowIndex')
                ->title('#')
                ->orderable(false)
                ->exportable(false)
                ->printable(false)
                ->width(10),
            Column::make('type')->title(__('title.type'))->orderable(true)->searchable(true),
            Column::make('message')->title(__('title.message'))->orderable(true)->searchable(false),
//            Column::make('user.full_name')->title(__('users.full_name'))->orderable(true)->searchable(true),



            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->width(30)
                ->addClass('text-center')
                ->title(__('users.action'))
                ->orderable(false) // Make the 'action' column non-orderable
                ->searchable(false), // Optionally make the 'action' column non-searchable as well

        ];
    }

    /**
     * Get the filename for export.
     */
    protected function filename(): string
    {
        return 'Notification' . date('YmdHis');
    }
}
