<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{__('label.homepage')}}</title>

    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/script.js') }}" defer></script>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <!-- Styles -->
</head>

<body>
    <div class="">

        @if (Route::has('login'))
        <div class="top-right links">

            <div class="dropdown show" style="display: inline-block">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{__('header.currency') }}
                </a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="/currencies/USD">USD</a>
                    <a class="dropdown-item" href="/currencies/VND">VND</a>
                </div>
            </div>

            <div class="dropdown show ml-4" style="display: inline-block">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{__('header.language') }}
                </a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="/languages/en">English</a>
                    <a class="dropdown-item" href="/languages/vn">Vietnam</a>
                </div>
            </div>




            @auth
            @if(auth()->user()->roles[0]->name == 'Admin')
            <a href="/home">{{__('header.home')}}</a>
            @endif

            <a href="/user/order">{{__('header.order')}}</a>
            <a href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                {{__('header.logout')}}
            </a>
            <form id="logout-form" action="{{route('logout')}}" method="POST" style="display:none">
                @csrf
            </form>

            @else
            <a href="{{ route('login') }}">{{__('header.login')}}</a>

            @if (Route::has('register'))
            <a href="{{ route('register') }}">{{__('header.register')}}</a>
            @endif
            @endauth
        </div>

        @endif

        <div class="container">

            <h1>{{__('label.main-heading')}}</h1>
            <h3>{{__('label.sub-heading')}}</h3>


            <!-- Search form -->
            <div id="search-div">
                <form action="/search" method="post">
                    @csrf
                    <input autocomplete="off" class="form-control" id="search-box" name="search" type="text" placeholder="Search" aria-label="Search">
                </form>
                <div id="search-result"></div>
            </div>
            <div class="row watch-list">
                @foreach($watches as $watch)


                <div class="watch-item col-3 pb-4">
                    <a href="/watches/{{$watch->id}}"><img src="{{$watch->image}}" style="max-width: 100%; width: 200px; height: auto;" /></a>
                    <div>
                        <p><b>{{$watch->category->brand}}</b> - {{$watch->name}}</p>
                        <span>{{number_format(($watch->price*(1-$watch->discount/100))*session('cur')->rate,1) . session('cur')->shortcut}}</span><span class="float-right">{{$watch->discount}}%</span>
                    </div>
                </div>

                @endforeach
            </div>
            {{$watches->links()}}

        </div>
    </div>
</body>

</html>