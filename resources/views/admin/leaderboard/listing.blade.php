@extends('layout.admin.index')

@section('title')

{{env('APP_NAME')}} - {{__('title.leaderboard')}}

@endsection

@section('content')
<div class="row">
    <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h6 class="card-title">{{__('title.leaderboard')}}</h6>
                </div>



                <!-- <div class="col-md-12 grid-margin">
                    <div class="card rounded">
                        <div class="card-body">
                            @foreach($leaderBoards as $leaderBoard)
                            <div class="d-flex justify-content-between mb-2 pb-2 {{$loop->last ? "":"border-bottom"}}">
                                <div class="d-flex align-items-center hover-pointer">
                                    <img class="img-xs rounded-circle"
                                    src="{{$leaderBoard->user->image ? asset($leaderBoard->user->image):'https://via.placeholder.com/37x37'}}"
                                    alt="">
                                    <div class="ms-2">
                                        <p>{{$leaderBoard->user->full_name}}</p>
                                        <p class="tx-11 text-muted">{{__('on_going_challenge.total_views')}}: {{$leaderBoard->total_views}}</p>
                                        <p class="tx-11 text-muted">{{__('on_going_challenge.total_likes')}}: {{$leaderBoard->total_likes}}</p>
                                        <p class="tx-11 text-muted">{{__('on_going_challenge.challenges_participates')}}: {{$leaderBoard->total_challenge_participation}}</p>
                                        <p class="tx-11 text-muted">{{__('on_going_challenge.average_challenge_views')}}: {{$leaderBoard->total_views/$leaderBoard->total_challenge_participation}}</p>


                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div> -->



                <div class="row">
                <div class="col-lg-12">
                    <div class="leaderBoard-list-wrapper">
                        <div class="leaderBoard-list">
                            <ul>
                                @foreach($leaderBoards as $key => $leaderBoard)
                                <li class="single-leaderBoard">
                                    <div class="row gx-2">
                                        <div class="col-lg-1">
                                            <div class="leaderBoard-avatar position-relative">
                                                <img src="{{$leaderBoard->user->image ? asset($leaderBoard->user->image):'https://via.placeholder.com/37x37'}}">
                                                <div class="position-label-wrapper">
                                                    <label class="common-text">{{Number::ordinal($key+1)}}</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-11">
                                            <div class="leaderBoard-information ps-2">
                                                <h3>{{$leaderBoard->user->full_name}}</h3>
                                                <div class="leaderBoard-challenge-information">
                                                    <div class="single-challenge-wrapper border-chelle ">
                                                        <span class="single-title-view">{{__('on_going_challenge.total_views')}}</span>
                                                        <span class="single-title-value">{{\App\Models\Leaderboard::abbreviateNumber($leaderBoard->total_views)}}</span>
                                                    </div>
                                                    <div class="single-challenge-wrapper border-chelle">
                                                        <span class="single-title-view">{{__('on_going_challenge.total_likes')}}</span>
                                                        <span class="single-title-value">{{\App\Models\Leaderboard::abbreviateNumber($leaderBoard->total_likes)}}</span>
                                                    </div>
                                                    <div class="single-challenge-wrapper border-chelle">
                                                        <span class="single-title-view">{{__('on_going_challenge.challenges_participates')}}</span>
                                                        <span class="single-title-value">{{$leaderBoard->total_challenge_participation}}</span>
                                                    </div>
                                                    <div class="single-challenge-wrapper">
                                                        <span class="single-title-view">{{__('on_going_challenge.average_challenge_views')}}</span>
                                                        <span class="single-title-value">{{$leaderBoard->total_views/$leaderBoard->total_challenge_participation}}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            </div>


        </div>
    </div>
</div>






@endsection
@section('script')
<script type="text/javascript">
  $(document).ready(function(){
        $('.common-text').each(function(){
            var text = $(this).text();
            var lastTwoLetters = text.slice(-2);
            var textWithoutLastTwoLetters = text.slice(0, -2);
            var styledText = textWithoutLastTwoLetters + '<span class="small">' + lastTwoLetters[0] + '</span>' + '<span class="small">' + lastTwoLetters[1] + '</span>';
            $(this).html(styledText);
        });
    });
</script>
@endsection





