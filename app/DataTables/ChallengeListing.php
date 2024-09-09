<?php

namespace App\DataTables;

use App\Models\Challenge;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class ChallengeListing extends DataTable
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
                $actions = '
                        <a href="' . route("challenge.edit", ["challenge" => $dataTable]) . '" title="' . __('actions.edit') . '"  data-bs-toggle="tooltip" data-bs-placement="top">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit" style="color: rgba(58, 170, 53);"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                        </a>

                        <a data-url="' . route("challenge.destroy", ["challenge" => $dataTable]) . '" title="' . __('actions.delete') . '" class="deleteRecord"
                                           href="javascript:void(0)" title="' . __('actions.delete') . '" data-bs-toggle="tooltip" data-bs-placement="top">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash" style="color: rgba(58, 170, 53);"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                        </a>
                ';
                if (!empty($dataTable->video)) {
                    $actions .= '<a  data-video-url="' . asset($dataTable->video) . '" title="' . __('actions.view') . '" class="viewVideo"
                                           href="javascript:void(0)" title="' . __('actions.view') . '" data-bs-toggle="tooltip" data-bs-placement="top">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye" style="color: rgba(58, 170, 53);">
                                  <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                  <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </a>
                    ';
                     }

                return $actions;
            })
            ->editColumn('status', function ($dataTable) {
                return $dataTable->status == 1 ? __('options.approved') : __('options.disapproved');
            })
            ->editColumn('createdBy', function ($dataTable) {
                return $dataTable->user->full_name ?? 'N/A';
            });

        return $dataTable;
    }

    /**
     * Get the query source of dataTable.
     */
    public function query()
    {
        $challenge = Challenge::with('user')->select();


        return $challenge;
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('challenge-table')
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
            Column::make('price')->title(__('challenge.price'))->orderable(true)->searchable(true),
            Column::make('video')->title(__('challenge.video_url'))->orderable(false)->searchable(false),
            Column::make('user.full_name')->title(__('challenge.createdBy'))->orderable(true)->searchable(true),
            Column::make('status')->title(__('challenge.status'))->orderable(true)->searchable(true),


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
        return 'Challenge_' . date('YmdHis');
    }
}
