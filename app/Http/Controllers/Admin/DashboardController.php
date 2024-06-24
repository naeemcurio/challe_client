<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\Admin\DashboardService;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public $dashboardService;

    public function __construct(DashboardService $dashboardService)
    {
        $this->dashboardService =  $dashboardService;
    }

    public function index()
    {
        return $this->dashboardService->index();
    }
}
