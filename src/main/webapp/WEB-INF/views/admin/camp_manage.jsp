<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

		<!-- BEGIN CSS for this page -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css"/>	
		<style>	
		td.details-control {
		background: url('/admin/plugins/datatables/img/details_open.png') no-repeat center center;
		cursor: pointer;
		}
		tr.shown td.details-control {
		background: url('/admin/plugins/datatables/img/details_close.png') no-repeat center center;
		}
		</style>		
		<!-- END CSS for this page -->
		
		

<body class="adminbody">
		
<div id="main">



    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					
							
				<div class="row">
						<div class="col-xl-12">
								<div class="breadcrumb-holder">
										<h1 class="main-title float-left">캠핑장 관리</h1>
										<ol class="breadcrumb float-right">
											<li class="breadcrumb-item">Home</li>
											<li class="breadcrumb-item active">캠핑장 관리</li>
										</ol>
										<div class="clearfix"></div>
								</div>
						</div>
				</div>
				<!-- end row -->

				


				
				<div class="row" style="width: 100% !important; height: 100% !important;">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" >						
							<div class="card mb-3">
								<div class="card-header">
									<h3><i class="fa fa-list"></i> 캠핑장 관리</h3>
									캠핑장 리스트 추가, 수정 및 삭제	
								</div>
									
								<div class="card-body">
									
									<div class="table-responsive">
									<table id="example2" class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th></th>
												<th>캠핑장 일련번호</th>
												<th>캠핑장 이름</th>
												<th>캠핑장 종류</th>
												<th>지번 주소</th>
												<th>캠핑장 관리기관</th>
												<th>캠핑장 예약횟수</th>
											</tr>
										</thead>
										<!-- <tfoot>
											<tr>
												<th></th>
												
											</tr>
										</tfoot> -->
									</table>
									</div>
									
								</div>							
							</div><!-- end card-->					
						</div>
						

				</div>


            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->
    

</div>



<!-- BEGIN Java Script for this page -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" defer></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js" defer></script>

	<script>

	// START CODE FOR Child rows (show extra / detailed information) DATA TABLE 
	function format (d) {
		// `d` is the original data object for the row
		return '<div class="table-responsive" style="width:auto; height:200px; overflow-x:auto;" padding:50px>'+
			'<table class="table table-hover" style="width:auto; display: block;">'+
			'<thead>'+
			'<tr>'+
				'<th>캠핑장명</th>'+
				'<th>주소</th>'+
				'<th>캠핑장 전화번호</th>'+
				'<th>캠핑장 사이트(site) 수</th>'+
				'<th>1일최대수용인원</th>'+
				'<th>주차장 면 수</th>'+
				'<th>편의시설</th>'+
				'<th>안전시설</th>'+
				'<th>기타 부대시설</th>'+
				'<th>관리기관명</th>'+
				'<th>관리기관 전화번호</th>'+
				'<th>캠핑장 설명</th>'+
			'</tr>'+
			'</thead>'+
			'<tbody style="text-align:center;" border="1">'+
			'<tr>'+
				'<td><textarea name="camp_name">'+d.camp_name+'</textarea></td>'+
				'<td><textarea name="camp_name">'+d.address+'</textarea></td>'+
				'<td><input type="text" name="camp_name" value="'+d.camp_tel+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.site_num+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.full_num+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.parking+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.conv+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.sec_conv+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.etc_conv+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.agency_name+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.agency_tel+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.intro+'"></td>'+
			'</tr>'+
			'</tbody>'+
			'<tfoot>'+
			'<tr>'+
				'<input type="button" class="btn btn-outline-danger" id="del_camp" value="삭제">'+
				'&nbsp;'+ '<input type="button" class="edit btn btn-outline-primary" value="수정">'+
			'</tr>'+
			'</tfoot>'+
		'</table>'+
		'<div>'+
		'<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
				'<div class="modal-dialog" role="document">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<h5 class="modal-title" id="exampleModalLabel">test  </h5>'+
							'<button class="close" type="button" data-dismiss="modal" aria-label="Close">'+
								'<span aria-hidden="true">X</span>'+
							'</button>'+
						'</div>'+
						'<div class="modal-body">해당 캠핑장을 삭제하겠습니까?</div>'+
						'<div class="modal-footer">'+
							'<a class="btn" id="modalY" style="color:red !important;" href="campDel.wcc?camp_idx='+d.camp_idx+'">예</a>'+
							'<button class="btn" type="button" data-dismiss="modal">아니요</button>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'+
			'<script>'+
			'$("#del_camp").click(function(e){'+
				'e.preventDefault();'+
				'$("#testModal").modal("show");'+
			'})'+ 
			'<\/script>';
	}
	
	function formatt(d) {
		// `d` is the original data object for the row
		return 
			'<tbody style="text-align:center;" border="1">'+
			'<tr>'+
				'<td><input type="text" name="camp_name" value="'+d.camp_name+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.address+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.camp_tel+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.site_num+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.full_num+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.parking+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.conv+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.sec_conv+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.etc_conv+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.agency_name+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.agency_tel+'"></td>'+
				'<td><input type="text" name="camp_name" value="'+d.intro+'"></td>'+
			'</tr>'+
			'</tbody>';
	}
	
		
		$(document).ready(function() {
			var table = $('#example2').DataTable( {
				pageLength : 10,
				bPaginate : true,
				processing : true,
				ajax : {
					"url": "campData.wcc",
					"type": "POST",
					"contentType": "application/json; charset=utf-8"
				},
				columns: [
					{
						"className":      'details-control',
						"orderable":      true,
						"data":           null,
						"defaultContent": ''
					},
					{ data: "camp_idx" },
					{ data: "camp_name" },
					{ data: "conv" },
					{ data: "address" },
					{ data: "agency_name" },
					{ data: "total_booking",
					defaultContent : "<i>없음</i>"}
					
				]/* ,
				"order": [[1, 'asc']] */
			} );
			 
			// Add event listener for opening and closing details
			$('#example2 tbody').on('click', 'td.details-control', function () {
				var tr = $(this).closest('tr');
				var row = table.row(tr);
		 
				if ( row.child.isShown() ) {
					// This row is already open - close it
					row.child.hide();
					tr.removeClass('shown');
				}else {
					// Open this row
					row.child( format(row.data())).show();
					tr.addClass('shown');
				}
			} );
		} );
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE 		
		
				
		
	document.getElementsByClassName("edit").onclick = function(){
		let tr = this.closest('table');
		let row = table.row(tr);
		
		
			
			
	}
		
		
			
	</script>	
<!-- END Java Script for this page -->

</body>
