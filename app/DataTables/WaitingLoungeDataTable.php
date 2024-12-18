<?php

namespace App\DataTables;

use App\Models\ChallengeLog;
use App\Models\WaitingLounge;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class WaitingLoungeDataTable extends DataTable
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
            ->editColumn('matched_user_name',function($dataTable){
               return $dataTable->matched_user_name ?? 'N/A';
            })
            ->editColumn('waiting_cancel_date',function($dataTable){
               return $dataTable->waiting_cancel_date ?? 'N/A';
            })
            ->editColumn('ready_date',function($dataTable){
               return $dataTable->ready_date ?? 'N/A';
            });

        return $dataTable;

    }

    /**
     * Get the query source of dataTable.
     */
    public function query()
    {
        $data =  ChallengeLog::with('waitingLounge')->select();

        return $data;

    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
                    ->setTableId('waitinglounge-table')
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    //->dom('Bfrtip')
                    ->orderBy(0)
                    ->selectStyleSingle()
                    ->buttons([
                        Button::make('excel'),
                        Button::make('csv'),
                        Button::make('pdf'),
                        Button::make('print'),
                        Button::make('reset'),
                        Button::make('reload')
                    ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make('id'),
            Column::make('search_user_name')->title(__('title.user')),
            Column::make('price')->title(__('challenge.price')),
            Column::make('waiting_date')->title(__('challenge_log.search').' '.__('title.date')),
            Column::make('waiting_cancel_date')->title(__('challenge_log.search').' '.__('actions.cancel').' '.__('title.date')),
            Column::make('matched_user_name')->title(__('on_going_challenge.challenger')),
            Column::make('ready_date')->title(__('challenge_log.match_date')),
        ];
    }

    /**
     * Get the filename for export.
     */
    protected function filename(): string
    {
        return 'WaitingLounge_' . date('YmdHis');
    }
}
