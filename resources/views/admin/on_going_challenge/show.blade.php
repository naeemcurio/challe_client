@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.on_going_challenge') .' '. __('actions.view')}}

@endsection




@section('content')

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <h6 class="card-title">{{__('title.on_going_challenge') .' '. __('actions.view')}}</h6>
                    </div>

                    <div class="row mb-2">

                        {{--                        <h5 class="card-title">{{__('title.challenge')}}: <strong>{{$challengeAttempt->challenge->title}}</strong></h5>--}}

                        <h5 class="card-title">{{__('on_going_challenge.winning_amount')}}:
                            <strong>{{number_format($challengeAttempt->winning_amount,2)}}</strong></h5>

                        <span class="single-title-view">
                            <strong>{{__('title.challenge').' '.__('challenge.description')}}:</strong>
                        </span>

                        <span class="single-title-view mb-3">
                            {{$challengeAttempt->challenge->description}}
                        </span>


                    @if(isset($challengeAttempt->challengeRecords))
                            @foreach($challengeAttempt->challengeRecords as $challengeRecord)

                                <div class="col-12 col-md-6 col-xl-6">
                                    <div
                                        class="card {{$challengeAttempt->winner_id == $challengeRecord->challenger_id ? "winner":''}}">
                                        <div class="card-body">
                                            <h5 class="card-title">{{$challengeRecord->challenger->full_name}}
                                                @if($challengeRecord->submit_record_time)
                                                    <span class="badge bg-success">
                                                        {{\Carbon\Carbon::parse($challengeRecord->submit_record_time)->format('Y-m-d g:i:s.u A')}}
                                                    </span>
                                                @endif
                                            </h5>
{{--                                            @if($challengeAttempt->winner_id == $challengeRecord->challenger_id)--}}
{{--                                                <span>( {{strtoupper(__('on_going_challenge.winner'))}} )</span>--}}
{{--                                            @endif--}}
                                            <p class="card-text mb-3">
                                                <a href="{{$challengeRecord->video_url}}" target="_blank">
                                                    {{$challengeRecord->video_url}}
                                                </a>
                                            </p>
                                            @if($challengeRecord->comments)
                                                <p class="card-text comment-wrapper mb-3">
                                                    {{$challengeRecord->comments}}
                                                </p>
                                            @endif

{{--                                            <a href="#" class="btn btn-primary">Go somewhere</a>--}}
                                            @if(!$challengeRecord->challengeResult)
                                                <div class="text-center mb-4">
                                                    <button
                                                        class="primary-theme-btn submitResultBtn">
                                                        {{__('actions.submit').' '.__('on_going_challenge.result')}}
                                                    </button>
                                                </div>
                                            @endif

                                            <div class="finding {{$challengeRecord->challengeResult ? "":'d-none'}}">
                                                <form class="submitResultForm"
                                                      action="{{route('on-going-challenge-result-submit',['on_going_challenge'=>$challengeAttempt->id,
    'challenge_record_id'=>$challengeRecord->id,'challenge_id'=>$challengeAttempt->challenge_id,'challenger_id'=>$challengeRecord->challenger_id])}}">
                                                    @csrf

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="mb-3 innerDashboard-inputs">
                                                                <label
                                                                    class="form-label">{{__('on_going_challenge.total_likes')}}</label>
                                                                <input type="text" name="likes"
                                                                       {{$challengeRecord->challengeResult ? "readonly":''}} class="form-control likesField"
                                                                       value="{{$challengeRecord->challengeResult ? $challengeRecord->challengeResult->likes:''}}"
                                                                       placeholder="{{__('title.enter')}} {{__('on_going_challenge.total_likes')}}">
                                                            </div>
                                                        </div><!-- Col -->

                                                        <div class="col-sm-6">
                                                            <div class="mb-3 innerDashboard-inputs">
                                                                <label
                                                                    class="form-label">{{__('on_going_challenge.total_views')}}</label>
                                                                <input type="text" name="views"
                                                                       {{$challengeRecord->challengeResult ? "readonly":''}} class="form-control viewField"
                                                                       value="{{$challengeRecord->challengeResult ? $challengeRecord->challengeResult->views:''}}"
                                                                       placeholder="{{__('title.enter')}} {{__('on_going_challenge.total_views')}}">
                                                            </div>
                                                        </div><!-- Col -->
                                                        @if(!$challengeRecord->challengeResult)
                                                            <div class="text-center">
                                                                <button class="primary-theme-btn submit" type="button">
                                                                    {{__('actions.submit')}}
                                                                </button>
                                                            </div>
                                                        @endif


                                                    </div>


                                                </form>

                                            </div>

                                            @if(!$challengeAttempt->winner_id && sizeof($challengeAttempt->challengeResults) > 0)

                                                @foreach($challengeAttempt->challengeResults as $challengeResult)
                                                    @if($challengeResult->challenger_id == $challengeRecord->challenger_id )
                                                        <div class="text-center mb-4">
                                                            <a href="{{route('on-going-challenge-mark-winner',['on_going_challenge'=>$challengeAttempt->id,'challenger_id'=>$challengeRecord->challenger_id])}}"
                                                               class="primary-theme-btn">
                                                                {{__('on_going_challenge.mark_as_winner')}}
                                                            </a>

                                                        </div>
                                                    @endif
                                                @endforeach
                                            @endif

                                        </div>

                                        <div class="winner-medal-wrapper">
                                            <img src="{{asset('admin/img/quality.png')}}">
                                        </div>

                                    </div>

                                </div>

                            @endforeach
                        @endif


                        @if($challengeAttempt->readyLounge)
                            @if($challengeAttempt->readyLounge->user1_status == 2 )

                                @php
                                    $challengeUser = $challengeAttempt->readyLounge->user1;
                                @endphp

                                <div class="col-12 col-md-6 col-xl-6">
                                    <div class="card" style="border: var(--bs-card-border-width) solid red;">
                                        <div class="card-body">
                                            <h5 class="card-title">{{$challengeUser->full_name}}</h5>

                                            <p class="card-text  text-center">
                                                <img style="height: 263px" src="{{asset('admin/img/i-cant.avif')}}">
                                            </p>


                                        </div>

                                        <div class="winner-medal-wrapper">
                                            <img src="{{asset('admin/img/quality.png')}}">
                                        </div>

                                    </div>

                                </div>

                            @endif


                            @if($challengeAttempt->readyLounge->user2_status == 2 )
                                @php
                                    $challengeUser = $challengeAttempt->readyLounge->user2;
                                @endphp

                                <div class="col-12 col-md-6 col-xl-6">
                                    <div class="card" style="border: var(--bs-card-border-width) solid red;">
                                        <div class="card-body">
                                            <h5 class="card-title">{{$challengeUser->full_name}}</h5>

                                            <p class="card-text  text-center">
                                                <img style="height: 263px" src="{{asset('admin/img/i-cant.avif')}}">
                                            </p>


                                        </div>

                                        <div class="winner-medal-wrapper">
                                            <img src="{{asset('admin/img/quality.png')}}">
                                        </div>

                                    </div>

                                </div>

                            @endif

                        @endif

                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')

    <script>
        $(document).ready(function () {

            $('.submitResultBtn').click(function () {

                // Find the closest '.finding' within the current card-body
                var getParent = $(this).closest('.card-body').find('.finding');

                // Toggle the visibility of the found '.finding'
                getParent.toggleClass('d-none');

            });

            $('.submit').click(function () {
                var url = $(this).parents('form.submitResultForm').attr('action');
                var data = $(this).parents('form.submitResultForm').serialize();
                var thisRecord = $(this).parents('form.submitResultForm');
                $.blockUI({
                    css: {
                        border: 'none',
                        padding: '15px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: data,

                    success: function (response, status) {

                        if (response.result == 'success') {
                            $.unblockUI();
                            successMsg(response.message);
                            thisRecord.find('.likesField').attr('readonly', true);
                            thisRecord.find('.viewField').attr('readonly', true);
                            thisRecord.find('button').remove();
                            thisRecord.closest('.card-body').find('.submitResultBtn')
                                .remove();


                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);


                        } else if (response.result == 'error') {
                            $.unblockUI();
                            errorMsg(response.message);
                        }

                    },
                    error: function (data, status) {
                        if (data.status == 404) {
                            errorMsg(data.responseJSON.message);
                        } else {
                            $.unblockUI();
                            errorMsg(data.responseJSON.message);
                        }


                    },


                });

            });


        });
    </script>

@endsection




