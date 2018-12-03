<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>	
$(document).ready(function(){
	$(".bulk-result").hide(); 	
});
function result()
{	
}

function emailsend()
{	
	var chk = document.getElementsByName("table_records");
	var i=0,sum=0;
	var result=0;
	if(confirm("발송하시겠습니까?"))
	{
		for(i=0;i<chk.length;i++)
		{
			if(chk[i].checked == true)
			{				
				var email = $("#email"+chk[i].value).val();
				var contents= $("#data"+chk[i].value).html();
				result = result + sendProc(email,contents);				
				sum++;
			}
		}		
		if(sum==0){alert("발송할 인원을 체크해주세요."); return false;}
		if(result == 0)
		{
				alert("발송 완료하였습니다.");
		}
	}
	
	//alert();
				
}

function sendProc(email,contents)
{	
	
	var result=1;
	$.ajax({
        type: "post",
        url : "/EmailSendProc.joil",
        dataType : "json", 
        async: false,
        data: {
        	email : email,
        	contents : contents
        },
      success : function(data) {    	  
    	  if(data.resultCnt != 1 )
    	  {
    		  alert(data.email+"메일이 정상적으로 발송되지 않았습니다.");
    	  }else //성공적
    	  {
    		  result=0;
    	  }
      },
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});	
	return result;
}

function InsertFrm(){
	var frm = document.InFrm;
	if(frm.el_name_seq.value==null || frm.el_name_seq.value=="")
	{		
		alert("성명을 선택하십시오.");
		frm.el_name_seq.focus();
		return false;
	}
	if(frm.el_email.value==null || frm.el_email.value=="")
	{		
		alert("이메일을 입력하십시오.");
		frm.el_email.focus();
		return false;
	}
	if(frm.el_year.value==null || frm.el_year.value=="")
	{		
		alert("년차를 입력하십시오.");
		frm.el_year.focus();
		return false;
	}
	frm.action="/EmailSendInsertProc.joil";
	frm.submit();
	
}

function ModifyFrm(el_seq)
{
	var frm = document.mFrm;
	if(confirm("수정하시겠습니까?"))
	{
		frm.el_seq.value= el_seq;
		frm.el_year.value = $("#el_year"+el_seq).val();
		frm.el_email.value = $("#el_email"+el_seq).val(); 
		frm.el_give_1.value = $("#el_give_1"+el_seq).val().replace(/,/g, '');
		frm.el_give_2.value = $("#el_give_2"+el_seq).val().replace(/,/g, '');
		frm.el_give_3.value = $("#el_give_3"+el_seq).val().replace(/,/g, '');
		frm.el_give_4.value = $("#el_give_4"+el_seq).val().replace(/,/g, '');
		frm.el_give_5.value = $("#el_give_5"+el_seq).val().replace(/,/g, '');
		frm.el_give_6.value = $("#el_give_6"+el_seq).val().replace(/,/g, '');
		frm.el_give_7.value = $("#el_give_7"+el_seq).val().replace(/,/g, '');
		frm.el_give_8.value = $("#el_give_8"+el_seq).val().replace(/,/g, '');
		frm.el_give_9.value = $("#el_give_9"+el_seq).val().replace(/,/g, '');

		frm.el_deduct_1.value = $("#el_deduct_1"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_2.value = $("#el_deduct_2"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_3.value = $("#el_deduct_3"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_4.value = $("#el_deduct_4"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_5.value = $("#el_deduct_5"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_6.value = $("#el_deduct_6"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_7.value = $("#el_deduct_7"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_8.value = $("#el_deduct_8"+el_seq).val().replace(/,/g, '');
		frm.el_deduct_9.value = $("#el_deduct_9"+el_seq).val().replace(/,/g, '');
		
		frm.action="/EmailSendUpdateProc.joil";
		frm.submit();
	}
	
}

</script>

<form name="mFrm" id="mFrm" method="post">
	<input type="hidden" name="el_seq" id="el_seq" />
	<input type="hidden" name="el_year" id="el_year" />
	<input type="hidden" name="el_email" id="el_email" />
	<input type="hidden" name="el_give_1" id="el_give_1" />
	<input type="hidden" name="el_give_2" id="el_give_2" />
	<input type="hidden" name="el_give_3" id="el_give_3" />
	<input type="hidden" name="el_give_4" id="el_give_4" />
	<input type="hidden" name="el_give_5" id="el_give_5" />
	<input type="hidden" name="el_give_6" id="el_give_6" />
	<input type="hidden" name="el_give_7" id="el_give_7" />
	<input type="hidden" name="el_give_8" id="el_give_8" />
	<input type="hidden" name="el_give_9" id="el_give_9" />
	
	<input type="hidden" name="el_deduct_1" id="el_deduct_1" />
	<input type="hidden" name="el_deduct_2" id="el_deduct_2" />
	<input type="hidden" name="el_deduct_3" id="el_deduct_3" />
	<input type="hidden" name="el_deduct_4" id="el_deduct_4" />
	<input type="hidden" name="el_deduct_5" id="el_deduct_5" />
	<input type="hidden" name="el_deduct_6" id="el_deduct_6" />
	<input type="hidden" name="el_deduct_7" id="el_deduct_7" />
	<input type="hidden" name="el_deduct_8" id="el_deduct_8" />
	<input type="hidden" name="el_deduct_9" id="el_deduct_9" />
	
</form>


 <div class="col-md-12 col-sm-12 col-xs-12" style="overflow:auto; overflow-y:hidden;">
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	<div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
	                    	  <button type="button" class="btn btn-round btn-success" onclick="javascript:emailsend();">발송</button>
                        </div>                    	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 <form name="InFrm" id ="InFrm" method="post" >
                                     
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead align="center">
                      <tr>
                        <th style="width: 25%; text-align:center;">성명</th>
                        <th style="width: *%; text-align:center;">Email</th>
                        <th style="width: 10%; text-align:center;">년차</th>
                        <th style="width: 15%; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td>
                    			<select class="form-control" name="el_name_seq" id="el_name_seq" >
							  	<option value="">선택</option>
							  	<#if UserList2!?default('0')?size &gt; 0 >
		                       	<#list UserList2 as aInfo>
		                      	 <option value="${aInfo.su_seq!}" >${aInfo.su_name!}</option>
		                        </#list>
		                        </#if>
		                      </select>
                    		</td>                    		
                    		<td>
                    			<label class="control-label" for="el_email"><span class="required blind">이메일 *</span></label>		
			                    <input type="text" id="el_email" name="el_email" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td>
                    			<label class="control-label" for="el_year"><span class="required blind">년차 *</span></label>		
			                    <input type="text" id="el_year" name="el_year" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<button type="button" class="btn btn-round btn-success" onclick="javascript:InsertFrm();return false;">등록</button>
                    		</td>
                    	</tr>
                    	</tbody>
                  </table>
                  </form> 
                  
                  
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i>발송 목록</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
						 <p>발송할 인원을 체크해주세요.</p>

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">성명 </th>
                            <th class="column-title">이메일 </th>
                            <th class="column-title">년차 </th>
                            <th class="column-title">총액 </th>
                            <th class="column-title">공제액합계 </th>
                            <th class="column-title">수령액 </th>
                            <th class="column-title no-link last"><span class="nobr">내용</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                        <#if List!?default('0')?size &gt; 0 >
                  		<#list List as Info>
                  		<input type="hidden" name="email${Info.el_seq!}" id="email${Info.el_seq!}" value="${Info.el_email!}" />
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records" value="${Info.el_seq!}">
                            </td>
                            <td class=" ">${Info.el_name!}</td>
                            <td class=" ">${Info.el_email!}</td>
                            <td class=" ">${Info.el_year!}</td>
                            <td class=" ">${Info.el_give_1 + Info.el_give_2 + Info.el_give_3 + Info.el_give_4 + Info.el_give_5 }</td>
                            <td class=" ">${Info.el_deduct_1 + Info.el_deduct_2 + Info.el_deduct_3 + Info.el_deduct_4 + Info.el_deduct_5}</td>
                            <td class="a-right a-right ">${Info.el_give_1 + Info.el_give_2 + Info.el_give_3 + Info.el_give_4 + Info.el_give_5  - (Info.el_deduct_1 + Info.el_deduct_2 + Info.el_deduct_3 + Info.el_deduct_4 + Info.el_deduct_5) }</td>
                            <td class=" last"><a data-toggle="modal" data-target=".${Info.el_seq!}">보기</a>
                            </td>
                          </tr>
                          </#list>
                  		  </#if>
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
                 

                </div>                
               
              </div>
            </div>
            
            <!-- 모달 팝업   -->
            <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button> -->
            <#assign month = .now?date?string('MM') />
            <#assign year = .now?date?string('YY') />
            
            
			<#if List!?default('0')?size &gt; 0 > 
            <#list List as Info>
                  <div  class="modal fade ${Info.el_seq!}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content" style="width:600px;">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">${Info.el_name!} 월 급여 명세서 </h4>
                          	이메일 : <input type="text" name="el_email${Info.el_seq!}" id="el_email${Info.el_seq!}" value="${Info.el_email!}" />
                          
                        </div>
                        <div class="modal-body " id="data${Info.el_seq!}" style="width:500px;">
                          <h2 style="width:500px;" class="panel-title" align="center"><font color="black" size="5">${year}&nbsp;년 &nbsp;&nbsp;${month?number -1} 월 &nbsp;&nbsp;&nbsp;급 여 지 급 명 세 서</font></h2>
                            <br/>
                            
                            <table style="text-align:center; width:500px; height:80px; font-color:black; border-collapse: collapse; border:3px black solid; "cellpadding="5" cellspacing="0"" >
                            	<tr>
                            		<td style="text-align:center;border:1px black solid;"><font color="black" size="3">성 명</font></td><td style="text-align:center;border:1px black solid;"><font color="black" size="3">${Info.el_name!}</font></td>
                            		<td style="text-align:center;border:1px black solid;"><font color="black" size="3">회 사 명</font></td><td style="text-align:center;border:1px black solid;"><font color="black" size="3">(주) 조 일</font></td>
                            		
                            	</tr>
                            	<tr>
                            		<td style="text-align:center;border:1px black solid;"><font color="black" size="3">직 책</font></td><td style="text-align:center;border:1px black solid;"><font color="black" size="3">${Info.el_grade!}</font></td>
                            		<td style="text-align:center;border:1px black solid;"><font color="black" size="3">소 속</font></td><td style="text-align:center;border:1px black solid;"><font color="black" size="3"></font></td>
                            	</tr>
                            </table>
                            <br/><br/>
                            
                            <table style="text-align:center; width:500px; height:500px; font-color:black; border-collapse: collapse; border:3px black solid; "cellpadding="5" cellspacing="0"" >
                              <thead>
                                <tr>
                                  <th colspan="2" style="text-align:center;border:1px black solid; width:250px;"><font color="black" size="4">급 여 내 역</font></th>
                                  <th colspan="2" style="text-align:center;border:1px black solid; width:250px;"><font color="black" size="4">세 액 및 공 제 내 역</font></th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="el_give_1${Info.el_seq!}" id="el_give_1${Info.el_seq!}" value="${Info.el_give_1!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3">갑&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;근&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세</font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="el_deduct_1${Info.el_seq!}" id="el_deduct_1${Info.el_seq!}" value="${Info.el_deduct_1!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_2${Info.el_seq!}" id="el_give_2${Info.el_seq!}" value="${Info.el_give_2!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;민&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_2${Info.el_seq!}" id="el_deduct_2${Info.el_seq!}" value="${Info.el_deduct_2!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">직&nbsp;&nbsp;책&nbsp;&nbsp;수&nbsp;&nbsp;당</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_3${Info.el_seq!}" id="el_give_3${Info.el_seq!}" value="${Info.el_give_3!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">국&nbsp;&nbsp;민&nbsp;&nbsp;연&nbsp;&nbsp;금</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_3${Info.el_seq!}" id="el_deduct_3${Info.el_seq!}" value="${Info.el_deduct_3!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_4${Info.el_seq!}" id="el_give_4${Info.el_seq!}" value="${Info.el_give_4!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">건&nbsp;강&nbsp;보&nbsp;험&nbsp;료</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_4${Info.el_seq!}" id="el_deduct_4${Info.el_seq!}" value="${Info.el_deduct_4!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">차&nbsp;량&nbsp;유&nbsp;지&nbsp;비</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_5${Info.el_seq!}" id="el_give_5${Info.el_seq!}" value="${Info.el_give_5!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">고&nbsp;&nbsp;용&nbsp;&nbsp;보&nbsp;&nbsp;험</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_5${Info.el_seq!}" id="el_deduct_5${Info.el_seq!}" value="${Info.el_deduct_5!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">연&nbsp;&nbsp;장&nbsp;&nbsp;수&nbsp;&nbsp;당</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_6${Info.el_seq!}" id="el_give_6${Info.el_seq!}" value="${Info.el_give_6!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">조&nbsp;퇴&nbsp;,외&nbsp;출&nbsp;외</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_6${Info.el_seq!}" id="el_deduct_6${Info.el_seq!}" value="${Info.el_deduct_6!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">교&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_7${Info.el_seq!}" id="el_give_7${Info.el_seq!}" value="${Info.el_give_7!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;불&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_7${Info.el_seq!}" id="el_deduct_7${Info.el_seq!}" value="${Info.el_deduct_7!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">잔&nbsp;&nbsp;업&nbsp;&nbsp;특&nbsp;&nbsp;근</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_8${Info.el_seq!}" id="el_give_8${Info.el_seq!}" value="${Info.el_give_8!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">경&nbsp;&nbsp;조&nbsp;&nbsp;사&nbsp;&nbsp;비</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_8${Info.el_seq!}" id="el_deduct_8${Info.el_seq!}" value="${Info.el_deduct_8!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">기&nbsp;&nbsp;타&nbsp;&nbsp;수&nbsp;&nbsp;당</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_give_9${Info.el_seq!}" id="el_give_9${Info.el_seq!}" value="${Info.el_give_9!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">기&nbsp;&nbsp;타&nbsp;&nbsp;공&nbsp;&nbsp;제</font></td><td style="border:1px black solid;"><font color="black" size="3"><input type="number" name="el_deduct_9${Info.el_seq!}" id="el_deduct_9${Info.el_seq!}" value="${Info.el_deduct_9!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>   
                                <tr >
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                </tr>
                                <tr >
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                </tr>  
                                <tr >
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                </tr>  
                                <tr >
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                	<td style="border:1px black solid;"><font color="black" size="3">년&nbsp;&nbsp;차&nbsp;&nbsp;일&nbsp;&nbsp;수</font></td><td style="border:1px black solid;text-align:right;"><font color="black" size="3"><input type="number" name="el_year${Info.el_seq!}" id="el_year${Info.el_seq!}" value="${Info.el_year!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>  
                                <tr >
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                </tr> 
                                <tr>
                                	<td style="border:1px black solid;">&nbsp;</td><td style="border:1px black solid;">&nbsp;</td>
                                	<td style="border:1px black solid;"><font color="black" size="3">공&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</font></td><td style="border:1px black solid;background-color:#FFFFCC;text-align:right;"><font color="black" size="3">${Info.el_deduct_sum!}&nbsp;&nbsp;</font></td>
                                </tr>  
                                <tr>
                                	<td style="border:1px black solid;"><font color="black" size="3">급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</font></td><td style="background-color:#FFFFCC;text-align:right;"><font color="black" size="3">${Info.el_give_sum!}&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;"><font color="black" size="3">실&nbsp;&nbsp;수&nbsp;&nbsp;령&nbsp;&nbsp;액</font></td><td style="background-color:#FFFFCC;text-align:right;"><font color="black" size="3">${Info.el_give_sum - Info.el_deduct_sum}&nbsp;&nbsp;</font></td>
                                </tr>
                              </tbody>
                            </table>
                            
                            <br/>
                          
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" onclick="javascript:ModifyFrm('${Info.el_seq!}');">수정</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div> 

                      </div>
                    </div>
                  </div>
            </#list>
            </#if>
			