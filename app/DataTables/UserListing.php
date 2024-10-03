<?php

namespace App\DataTables;

use App\Models\User;
use HPWebdeveloper\LaravelPayPocket\Facades\LaravelPayPocket;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class UserListing extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query Results from query() method.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        $dataTable = new EloquentDataTable($this->query());

        $dataTable->filterColumn('status', function ($query, $keyword) {
            if (strtolower($keyword) === strtolower(__('options.approved'))) {
                $query->where('status', 1);
            } elseif (strtolower($keyword) === strtolower(__('options.disapproved'))) {
                $query->where('status', 0);
            }
        });


        $dataTable->addIndexColumn()
//            ->addIndexColumn()
            ->addColumn('action', function ($dataTable) {

                $actionButtons = '';

                // Chat button appears first
                if (!$dataTable->chat) {
                    $actionButtons .= '
                        <a title="' . __('title.start') . ' ' . __('title.chat') . '"
                           href="javascript:void(0)"
                           data-url="' . route('users.start_chat', ['user' => $dataTable]) . '"
                           class="startChatConfirmation">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square" style="color: rgba(58, 170, 53);">
                                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                            </svg>
                        </a>
                    ';
                } elseif ($dataTable->chat->status == 1) {
                    $actionButtons .= '
                        <a title="' . __('title.start') . ' ' . __('title.chat') . '"
                           href="javascript:void(0)"
                           data-url="' . route('users.start_chat', ['user' => $dataTable]) . '"
                           class="startChatConfirmation">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square" style="color: rgba(58, 170, 53);">
                                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                            </svg>
                        </a>
                    ';
                }

                // Edit button
                $actionButtons .= '
                    <a href="' . route("users.edit", ["user" => $dataTable]) . '" title="' . __('actions.edit') . '"  data-bs-toggle="tooltip" data-bs-placement="top">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit" style="color: rgba(58, 170, 53);">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                    </a>
                ';

                // Delete button
                $actionButtons .= '
                    <a data-url="' . route("users.destroy", ["user" => $dataTable]) . '" title="' . __('actions.delete') . '" class="deleteRecord"
                       href="javascript:void(0)" title="' . __('actions.delete') . '" data-bs-toggle="tooltip" data-bs-placement="top">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash" style="color: rgba(58, 170, 53);">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                        </svg>
                    </a>
                ';

                return $actionButtons;
            })
            ->editColumn('wallet_amount', function ($dataTable) {
                return LaravelPayPocket::checkBalance($dataTable);
            });

        return $dataTable;
    }

    /**
     * Get the query source of dataTable.
     */
    public function query()
    {
        $user = User::where('role_id', 2)->select();


        return $user;
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('user-table')
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


            Column::make('full_name')->title(__('users.full_name'))->orderable(true)->searchable(true),
            Column::make('nick_name')->title(__('users.nick_name'))->orderable(true)->searchable(true),
            Column::make('email')->title(__('users.email'))->orderable(true)->searchable(true),
            Column::make('phone_number')->title(__('users.phone_number'))->orderable(true)->searchable(true),
            Column::make('wallet_amount')->title(__('users.wallet_amount'))->orderable(false)->searchable(false),

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
        return 'User_' . date('YmdHis');
    }
}
