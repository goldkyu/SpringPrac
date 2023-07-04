<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
  <head>
    <title>LOGO</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="CSS/join.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  </head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="js/joinCheck.js"></script>
  <script>
    function findCode() {
      new daum.Postcode({
        oncomplete: function (data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ""; // 참고 항목 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
            extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== "" && data.apartment === "Y") {
            extraRoadAddr +=
              extraRoadAddr !== ""
                ? ", " + data.buildingName
                : data.buildingName;
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraRoadAddr !== "") {
            extraRoadAddr = " (" + extraRoadAddr + ")";
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById("uAd").value = roadAddr;

          // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          if (roadAddr !== "") {
            document.getElementById("uExAd").value = extraRoadAddr;
          } else {
            document.getElementById("uExAd").value = "";
          }
        },
      }).open();
    }
  </script>

  <body style="overflow-x: hidden">
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:include page ="siteHead.jsp"/>

    <section>
      <div id="mainBox">
        <div id="regiForm">
          <form
            action="memCheck.jsp"
            onsubmit="return infoSubmit()"
            method="post"
            name="mainRegist"
          >
            <ul>
              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>

                  <li>
                    <input
                      type="text"
                      name="userID"
                      class="inWithBtn infos noKor"
                      placeholder=" 아이디"
                      id="userIDinput"
                    />
                    <input
                      type="button"
                      name="dupCheck"
                      class="formButton btn"
                      id="dupBtn"
                      value="중복 확인"
                      onclick="dupCheck()"
                    />
                  </li>
                  <li>
                    <b id="idwarn" class="smallfonts"> 4~20자/영문 + 숫자 </b>
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>

              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="password"
                      name="userPW"
                      class="inWithNon infos noKor"
                      placeholder=" 비밀번호"
                    />
                  </li>

                  <li>
                    <b class="smallfonts" id="passWarn">
                      8~20자/영문 + 숫자 조합
                    </b>
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="password"
                      name="userPWCH"
                      class="inWithNon infos noKor"
                      placeholder=" 비밀번호 확인"
                    />
                  </li>
                  <li>
                    <b class="smallfonts" id="passChWarn"> 다시 입력하세요. </b>
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>
              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="text"
                      name="uName"
                      class="inWithNon infos"
                      placeholder=" 이름"
                    />
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>
              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="text"
                      name="userEmail"
                      class="inEmail infos noKor"
                      placeholder=" 이메일"
                    />
                    <b class="fonts">@</b>
                    <select name="email_back" class="sel">
                      <option value="daum.net">daum.net</option>
                      <option value="naver.com">naver.com</option>
                      <option value="hanmail.com">hanmail.com</option>
                      <option value="gmail.com">gmail.com</option>
                    </select>
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>

              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="text"
                      name="uBirthYear"
                      class="birth infos onlyNum"
                      placeholder=" YYYY"
                      maxlength="4"
                    />
                    <select name="uBirthMonth" class="birthSel">
                      <option value="01">01</option>
                      <option value="02">02</option>
                      <option value="03">03</option>
                      <option value="04">04</option>
                      <option value="05">05</option>
                      <option value="06">06</option>
                      <option value="07">07</option>
                      <option value="08">08</option>
                      <option value="09">09</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                    </select>
                    <select name="uBirthDay" class="birthSel">
                      <option value="01">01</option>
                      <option value="02">02</option>
                      <option value="03">03</option>
                      <option value="04">04</option>
                      <option value="05">05</option>
                      <option value="06">06</option>
                      <option value="07">07</option>
                      <option value="08">08</option>
                      <option value="09">09</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="13">13</option>
                      <option value="14">14</option>
                      <option value="15">15</option>
                      <option value="16">16</option>
                      <option value="17">17</option>
                      <option value="18">18</option>
                      <option value="19">19</option>
                      <option value="20">20</option>
                      <option value="21">21</option>
                      <option value="22">22</option>
                      <option value="23">23</option>
                      <option value="24">24</option>
                      <option value="25">25</option>
                      <option value="26">26</option>
                      <option value="27">27</option>
                      <option value="28">28</option>
                      <option value="29">29</option>
                      <option value="30">30</option>
                      <option value="31">31</option>
                    </select>
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>

              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="text"
                      name="uAd"
                      id="uAd"
                      class="inWithBtn infos"
                      placeholder=" 주소"
                    />
                    <input
                      type="button"
                      name="findAddr"
                      class="formButton btn"
                      value="주소 찾기"
                      onclick="findCode()"
                    />
                  </li>
                  <li>
                    <input
                      type="text"
                      name="uExAd"
                      id="uExAd"
                      class="inWithNon infos"
                      placeholder=" 상세 주소"
                    />
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>

              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="text"
                      name="userPnum"
                      class="inWithNon infos onlyNum"
                      placeholder="전화번호 - 없이 입력"
                      maxlength="11"
                    />
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                </ul>
              </li>

              <li>
                <ul>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="submit"
                      name="join"
                      id="subBtn"
                      class="inWithNon btn bottomBtn"
                      value="가입 하기"
                    />
                  </li>
                  <li>
                    <div class="divair"></div>
                  </li>
                  <li>
                    <input
                      type="reset"
                      class="inWithNon btn bottomBtn"
                      value="리셋"
                    />
                  </li>
                </ul>
              </li>
            </ul>
          </form>
        </div>
      </div>
    </section>

    <jsp:include page="siteFooter.jsp"/>
    
  </body>
</html>
