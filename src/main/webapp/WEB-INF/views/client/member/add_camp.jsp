<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ================================
    START BREADCRUMB AREA
================================= -->
<section class="breadcrumb-area">
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-content">
						<h2 class="breadcrumb__title">add listing</h2>
						<ul class="breadcrumb__list">
							<li class="active__list-item"><a href="index.html">home</a></li>
							<li class="active__list-item">listings</li>
							<li>add listing</li>
						</ul>
					</div>
					<!-- end breadcrumb-content -->
				</div>
				<!-- end col-lg-12 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end breadcrumb-wrap -->
	<div class="bread-svg">
		<svg viewBox="0 0 500 150" preserveAspectRatio="none">
            <path
				d="M-4.22,89.30 C280.19,26.14 324.21,125.81 511.00,41.94 L500.00,150.00 L0.00,150.00 Z"></path>
        </svg>
	</div>
	<!-- end bread-svg -->
</section>
<!-- end breadcrumb-area -->
<!-- ================================
    END BREADCRUMB AREA
================================= -->

<!-- ================================
    START ADD-LISTING AREA
================================= -->
<section class="add-listing-area padding-top-40px padding-bottom-100px">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 mx-auto">
				<div class="billing-form-item">
					<div class="billing-title-wrap">
						<h3 class="widget-title pb-0">캠핑장 등록하기</h3>
						<div class="title-shape margin-top-10px"></div>
					</div>
					<!-- billing-title-wrap -->
					<div class="billing-content">
						<div class="contact-form-action">
							<form method="post">
								<div class="row">
									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">캠핑장 이름</label>
											<div class="form-group">
												<span class="la la-pencil-square-o form-icon"></span> <input
													class="form-control" type="text" name="name"
													placeholder="Enter your listing title">
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12" style="margin-bottom: 20px">
										<div class="input-box">
											<label class="label-text">주소</label>
										</div>
										<div class="input-group"">
											<!-- <input id="addrZip" style="width:500px">
                                            <input type="button" id="bt_addr" onclick="bt_addr_click();" value="주소 찾기">  -->
											<!-- <span class="la la-pencil-square-o form-icon"></span> -->
											<input class="form-control" type="text" id="sample5_address"
												placeholder="주소"> <input type="button"
												onclick="sample5_execDaumPostcode()"
												class="theme-btn border-0" style="margin-left: 20px"
												value="주소 검색">
										</div>

										<div id="map"
											style="height: 300px; margin-top: 10px; display: none"></div>

										<!-- <div class="form-group mb-0">
                                                <select class="select-option-field-2">
                                                    <option value >Select a Category</option>
                                                    <option value="1">Shops</option>
                                                    <option value="2">Hotels</option>
                                                    <option value="3">Restaurants</option>
                                                    <option value="4">Fitness</option>
                                                    <option value="5">Travel</option>
                                                    <option value="6">Salons</option>
                                                    <option value="7">Event</option>
                                                    <option value="8">Business</option>
                                                </select>
                                            </div>end form-group -->

									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">업체 전화번호</label>
											<div class="form-group">
												<span class="la la-pencil-square-o form-icon"></span> <input
													id="phoneNum" class="form-control" type="text" name="name"
													placeholder="업체의 전화번호를 정확히 입력해 주세요">
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->



									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">주차장 이용 가능 수</label>
											<div class="form-group">
												<span class="la la-pencil-square-o form-icon"></span> <input
													class="form-control" type="text" name="name"
													placeholder="주차할 수 있는 주차대 수를 입력해 주세요">
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">편의시설</label>
											<div class="billing-form-item">

												<div class="billing-content">
													<div class="custom-checkbox">
														<input type="checkbox" id="chb1"> <label
															for="chb1">화장실</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb2"> <label
															for="chb2">샤워실</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb3"> <label
															for="chb3">백화점</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb4"> <label
															for="chb4">편의점</label>
													</div>
													<!-- end custom-checkbox -->
												</div>
												<!-- end billing-content -->
											</div>
											<!-- end billing-form-item -->
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">안전시설</label>
											<div class="billing-form-item">

												<div class="billing-content">
													<div class="custom-checkbox">
														<input type="checkbox" id="chb12"> <label
															for="chb12">화장실</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb22"> <label
															for="chb22">샤워실</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb32"> <label
															for="chb32">백화점</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb42"> <label
															for="chb42">편의점</label>
													</div>
													<!-- end custom-checkbox -->
												</div>
												<!-- end billing-content -->
											</div>
											<!-- end billing-form-item -->
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">기타 부대시설</label>
											<div class="billing-form-item">

												<div class="billing-content">
													<div class="custom-checkbox">
														<input type="checkbox" id="chb13"> <label
															for="chb13">화장실</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb23"> <label
															for="chb23">샤워실</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb33"> <label
															for="chb33">백화점</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="chb43"> <label
															for="chb43">편의점</label>
													</div>
													<!-- end custom-checkbox -->
												</div>
												<!-- end billing-content -->
											</div>
											<!-- end billing-form-item -->
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">이용 시간</label>
										</div>
									</div>
									<!-- end col-lg-12 -->
									<div class="col-lg-6">
										<div class="form-group">
											<select class="select-option-field-9">
												<option value>체크인</option>
												<option value="open">체크인</option>
												<option value="1">1:00am</option>
												<option value="2">2:00am</option>
												<option value="3">3:00am</option>
												<option value="4">4:00am</option>
												<option value="5">5:00pm</option>
												<option value="6">6:00pm</option>
												<option value="7">7:00pm</option>
												<option value="8">8:00pm</option>
												<option value="9">9:00am</option>
												<option value="10">10:00am</option>
												<option value="11">11:00am</option>
												<option value="12">12:00am</option>
												<option value="13">1:00pm</option>
												<option value="14">2:00pm</option>
												<option value="15">3:00pm</option>
												<option value="16">4:00pm</option>
												<option value="17">5:00pm</option>
												<option value="18">6:00pm</option>
												<option value="19">7:00pm</option>
												<option value="20">8:00pm</option>
												<option value="21">9:00pm</option>
												<option value="22">10:00pm</option>
												<option value="23">11:00pm</option>
												<option value="24">12:00pm</option>
											</select>
										</div>
										<!-- end form-group -->
									</div>
									<!-- end col-lg-6 -->
									<div class="col-lg-6">
										<div class="form-group">
											<select class="select-option-field-10">
												<option value>체크아웃</option>
												<option value="closed">체크아웃</option>
												<option value="1">1:00am</option>
												<option value="2">2:00am</option>
												<option value="3">3:00am</option>
												<option value="4">4:00am</option>
												<option value="5">5:00pm</option>
												<option value="6">6:00pm</option>
												<option value="7">7:00pm</option>
												<option value="8">8:00pm</option>
												<option value="9">9:00am</option>
												<option value="10">10:00am</option>
												<option value="11">11:00am</option>
												<option value="12">12:00am</option>
												<option value="13">1:00pm</option>
												<option value="14">2:00pm</option>
												<option value="15">3:00pm</option>
												<option value="16">4:00pm</option>
												<option value="17">5:00pm</option>
												<option value="18">6:00pm</option>
												<option value="19">7:00pm</option>
												<option value="20">8:00pm</option>
												<option value="21">9:00pm</option>
												<option value="22">10:00pm</option>
												<option value="23">11:00pm</option>
												<option value="24">12:00pm</option>
											</select>
										</div>
										<!-- end form-group -->
									</div>
									<!-- end col-lg-6 -->

								</div>
								<!-- end row -->
							</form>
						</div>
						<!-- end contact-form-action -->
					</div>
					<!-- end billing-content -->
				</div>
				<!-- end billing-form-item -->
				<div class="billing-form-item">
					<div class="billing-title-wrap">
						<h3 class="widget-title pb-0">상세정보 등록하기</h3>
						<div class="title-shape margin-top-10px"></div>
					</div>
					<!-- billing-title-wrap -->
					<div class="billing-content">
						<div class="contact-form-action">
							<form method="post">
								<div class="row">
									<div class="col-lg-12">
										<div class="input-box" style="margin-bottom: 10px">
											<label class="label-text">캠핑 종류</label>
											<div class="form-group mb-0">
												<select class="select-option-field-2">
													<option value>Select a Camping</option>
													<option value="1">캠핑</option>
													<option value="2">글램핑</option>
													<option value="3">노지 캠핑</option>
													<option value="4">차박</option>
												</select>
											</div>
											<!-- end form-group -->
										</div>
									</div>
									<!-- end col-lg-12 -->


									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">캠핑장 최대 수용 인원수</label>
											<div
												class="booking-content d-flex align-items-center justify-content-between text-center">
												<div class="form-group">
													<div class="input-number-group">

														<div class="input-group-button">
															<span class="input-number-decrement">-</span>
														</div>
														<input class="input-number" type="number" value="0"
															min="0" max="1000">
														<div class="input-group-button">
															<span class="input-number-increment">+</span>
														</div>
													</div>
													<!-- end input-number-group -->
												</div>
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->


									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">캠핑장 소개 <i
												class="la la-question tip ml-1" data-toggle="tooltip"
												data-placement="top" title="최대 30글자까지 입력가능합니다."></i>
											</label>
											<div class="form-group">
												<span class="la la-pencil form-icon"></span>
												<textarea class="message-control form-control"
													style="height: 100px" name="message"
													placeholder="캠핑장 소개글을 입력해주세요."></textarea>
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">대표 사진 (썸네일)</label>
											<div class="form-group">
												<div class="drag-and-drop-wrap">
													<div class="drag-and-drop-file">
														<form action="" method="post"
															enctype="multipart/form-data">
															<input type="file" name="files[]" id="filer_input1"
																multiple="multiple">
														</form>
													</div>
													<!-- end custom-file -->
												</div>
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->
									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">상세 사진</label>
											<div class="form-group">
												<div class="drag-and-drop-wrap">
													<div class="drag-and-drop-file">
														<form action="" method="post"
															enctype="multipart/form-data">
															<input type="file" name="files[]" id="filer_input2"
																multiple="multiple">
														</form>
													</div>
													<!-- end custom-file -->
												</div>

											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">바베큐 이용 가능 유/무</label>
											<div class="billing-form-item">

												<div class="billing-content">
													<div class="custom-checkbox">
														<input type="checkbox" id="yes" name="checkbox" value="chk1" onClick="javascript:checkOnly(this);"> <label for="yes">가능</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="custom-checkbox">
														<input type="checkbox" id="no" name="checkbox" value="chk2" onClick="javascript:checkOnly(this);"> <label for="no">불가능</label>
													</div>
													<!-- end custom-checkbox -->
													<div class="form-group">
														<span class="la la-dollar form-icon"></span> <input
															id="bbq-price" class="form-control" type="text"
															name="name" placeholder="바베큐 이용 가능 시 요금을 입력해 주세요">
													</div>
												</div>
												<!-- end billing-content -->
											</div>
											<!-- end billing-form-item -->
										</div>
									</div>
									<!-- end col-lg-12 -->

									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">이용 요금</label>
											<div class="form-group">
												<span class="la la-dollar form-icon"></span> <input
													id="camp-price" class="form-control" type="text"
													name="name" placeholder="캠핑장 가격을 정확히 입력해 주세요">
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->


								</div>
								<!-- end row -->
							</form>
						</div>
						<!-- end contact-form-action -->
					</div>
					<!-- end billing-content -->
				</div>
				<!-- end billing-form-item -->



				<div class="billing-form-item p-0 border-0 mb-0 shadow-none">
					<div class="billing-content p-0">
						<div class="custom-checkbox d-block mr-0">
							<input type="checkbox" id="chb13"> <label for="chb13">WeCamp의
								<a href="#" class="color-text">서비스 정책</a>에 동의합니다.
							</label>
						</div>
						<!-- end custom-checkbox -->
						<!-- <div class="custom-checkbox d-block mr-0">
                            <input type="checkbox" id="chb14">
                            <label for="chb14">I Agree to Dirto's <a href="#" class="color-text">Terms of Services</a></label>
                        </div>end custom-checkbox -->
						<div class="btn-box mt-4">
							<button type="submit" class="theme-btn border-0">캠핑장 업로드</button>
						</div>
						<!-- end btn-box -->
					</div>
					<!-- end billing-content -->
				</div>
				<!-- end billing-form-item -->
			</div>
			<!-- end col-lg-9 -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</section>
<!-- end add-listing-area -->
<!-- ================================
    END ADD-LISTING AREA
================================= -->

<!-- ================================
    START CTA AREA
================================= -->
<section class="cta-area cta-area2">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cta-box d-flex align-items-center">
					<div class="col-lg-8">
						<div class="section-heading">
							<h2 class="sec__title text-white">Subscribe to Newsletter!</h2>
							<p class="sec__desc">Subscribe to get latest updates and
								information.</p>
						</div>
						<!-- end section-heading -->
					</div>
					<!-- end col-lg-8 -->
					<div class="col-lg-4">
						<div class="contact-form-action">
							<form method="post">
								<div class="form-group mb-0">
									<span class="la la-envelope-o form-icon"></span> <input
										class="form-control" type="email"
										placeholder="Enter your email">
									<button class="theme-btn" type="submit">Subscribe</button>
								</div>
							</form>
						</div>
						<!-- end contact-form-action -->
					</div>
					<!-- end col-lg-3 -->
				</div>
				<!-- end cta-box -->
			</div>
			<!-- end col-lg-12 -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</section>
<!-- end cta-area -->


<!-- ================================
    END CTA AREA
================================= -->

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5232256f969f43eca1d4f511ef672cf1&libraries=services"></script>
<!-- <script>
function bt_addr_click(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
}
</script> -->

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		//포인트 입력 시 자동으로 ',(콤마)' 입력
		$("input[id='camp-price']").bind('keyup', function(e) {
			var rgx1 = /\D/g;
			var rgx2 = /(\d+)(\d{3})/;
			var num = this.value.replace(rgx1, "");

			while (rgx2.test(num))
				num = num.replace(rgx2, '$1' + ',' + '$2');
			this.value = num;

		});
	})

	$(document).ready(function() {
		//포인트 입력 시 자동으로 ',(콤마)' 입력
		$("input[id='bbq-price']").bind('keyup', function(e) {
			var rgx1 = /\D/g;
			var rgx2 = /(\d+)(\d{3})/;
			var num = this.value.replace(rgx1, "");

			while (rgx2.test(num))
				num = num.replace(rgx2, '$1' + ',' + '$2');
			this.value = num;

		});
	})

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});

	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
					}
				});
			}
		}).open();
	}
	
	
	/* 전화번호 하이픈  */
	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	  
	      return str;
	}


	var phoneNum = document.getElementById('phoneNum');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}
	
	
	function checkOnly(chk){

		   var obj = document.getElementsByName("checkbox");

		      for(var i=0; i<obj.length; i++){
		            if(obj[i] != chk){
		                  obj[i].checked = false;
		                  }
		            }
		    }
	
	$('#no').click(function() {
		$("#bbq-price").attr("disabled",true);
		});
	
	$('#yes').click(function() {
		$("#bbq-price").removeAttr("disabled");
		});


</script>