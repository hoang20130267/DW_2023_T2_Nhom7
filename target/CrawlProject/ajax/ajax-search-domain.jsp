<%@ page import="ETL.Load" %>
<%@ page import="Bean.Dmart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String searchDate = (String) request.getAttribute("searchDate");

  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
  LocalDate dateBefore = LocalDate.parse(searchDate, formatter);

  DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("M/d/yyyy");
  String formattedDate = dateBefore.format(outputFormatter);

  int indexOfLastSlash = searchDate.lastIndexOf("/");
  String dayMonth = searchDate.substring(0, indexOfLastSlash);
  String year = searchDate.substring(indexOfLastSlash + 1);%>
<div id="page_content">
  <%if(formattedDate.equals(Load.getCurrentDate())) {%>
  <h1 class="pagetitle" style="font-size: 30px">
    KẾT QUẢ XỔ SỐ MỚI NHẤT
  </h1>
  <%} else {%>
  <h1 class="pagetitle" style="font-size: 30px">
    KẾT QUẢ XỔ SỐ
  </h1>
  <%}%>
  <h1 class="pagetitle1" style="font-size: 30px">
    NGÀY <%=searchDate%>
  </h1>
  <div></div>
    <%String domain = (String) request.getAttribute("domain");%>
  <%if(domain.equals("1")){%>
  <div class="box_kqxs" id="kqxs_1-16-11-2023">
    <div class="xsmn miennam4cot">
      <div class="tenbkqxs" style="background: #fdbb03 !important;">
        <div class="title">
          <a href="/truc-tiep-xo-so-mien-nam-xstt-mn-xsmn" style="color: black !important"
          >KẾT QUẢ XỔ SỐ Miền Nam<span class="hidemax460">
                              - KQXS MN</span
          ></a
          >
        </div>
        <div class="ngaykqxs">
          <a
                  href="/ket-qua-xo-so/ngay-16-11-2023"
                  title="Click xem KQXS 3 Miền Ngày: 16/11/23"
          ><span class="date"
          ><span class="daymonth"><%=dayMonth%></span
          ><span class="year"><%=year%></span></span
          ></a
          >
        </div>

      </div>
      <div class="top_adv">
        <a
                href="https://ketqua.app"
                target="_blank"
                title="Tải ứng dụng xổ số về điện thoại"
        ><img
                align="absMiddle"
                alt=""
                border="0"
                src="/upload/images/banner/banner-adv-600x60_app_kqxs_xosohomnay.gif"
        /></a>
      </div>
      <div class="kqxs_content">
        <table
                width="100%"
                border="0"
                cellspacing="0"
                cellpadding="0"
        >
          <tbody>
          <tr>
            <td class="leftcl">
              <table
                      width="100%"
                      border="0"
                      cellspacing="0"
                      cellpadding="0"
              >
                <tbody>
                <tr>
                  <td class="thu">
                    <a
                            href=""
                            title=""
                    ></a
                    >
                  </td>
                </tr>
                <tr>
                  <td class="ten_giai_tam">100N</td>
                </tr>
                <tr>
                  <td class="ten_giai_bay">200N</td>
                </tr>
                <tr>
                  <td class="ten_giai_sau">400N</td>
                </tr>
                <tr>
                  <td class="ten_giai_nam">1TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_tu">3TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_ba">10TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_nhi">15TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_nhat">30TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_dac_biet">2Tỷ</td>
                </tr>
                </tbody>
              </table>
            </td>
            <td class="rightcl">
              <table
                      width="100%"
                      border="0"
                      cellspacing="0"
                      cellpadding="0"
              >
                <tbody>
                <%if(Load.getProvince(Load.getListFourthDmartMN(formattedDate)).equals("")){%>
                <tr>
                  <td>
                    <%List<Dmart> listMN1 = new Load().getListFirstDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-tay-ninh"
                                  title="Xổ Số  Tây Ninh"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListFirstDmartMN(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="30"
                          >
                            <%=Load.getNumberWinning("tam", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="665"
                          >
                            <%=Load.getNumberWinning("bay", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="7081"
                          >
                            <%=Load.getNumberWinning("sau1", listMN1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="5914"
                          >
                            <%=Load.getNumberWinning("sau2", listMN1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="5950"
                          >
                            <%=Load.getNumberWinning("sau3", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="8911"
                          >
                            <%=Load.getNumberWinning("nam", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="49666"
                          >
                            <%=Load.getNumberWinning("bon1", listMN1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="56531"
                          >
                            <%=Load.getNumberWinning("bon2", listMN1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="58811"
                          >
                            <%=Load.getNumberWinning("bon3", listMN1)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="22087"
                          >
                            <%=Load.getNumberWinning("bon4", listMN1)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="33866"
                          >
                            <%=Load.getNumberWinning("bon5", listMN1)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="45173"
                          >
                            <%=Load.getNumberWinning("bon6", listMN1)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="89281"
                          >
                            <%=Load.getNumberWinning("bon7", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="55388"
                          >
                            <%=Load.getNumberWinning("ba1", listMN1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="46257"
                          >
                            <%=Load.getNumberWinning("ba2", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="95488"
                          >
                            <%=Load.getNumberWinning("nhi", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="72056"
                          >
                            <%=Load.getNumberWinning("nhat", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="429638"
                          >
                            <%=Load.getNumberWinning("db", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMN2 = new Load().getListSecondDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-an-giang"
                                  title="Xổ Số  An Giang"
                          ><%=Load.getProvince(Load.getListSecondDmartMN(formattedDate))%><span class="namelong"
                          ></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="27"
                          >
                            <%=Load.getNumberWinning("tam", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="545"
                          >
                            <%=Load.getNumberWinning("bay", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="1740"
                          >
                            <%=Load.getNumberWinning("sau1", listMN2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="9424"
                          >
                            <%=Load.getNumberWinning("sau2", listMN2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="6873"
                          >
                            <%=Load.getNumberWinning("sau3", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="4132"
                          >
                            <%=Load.getNumberWinning("nam", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="78741"
                          >
                            <%=Load.getNumberWinning("bon1", listMN2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="21776"
                          >
                            <%=Load.getNumberWinning("bon2", listMN2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="78398"
                          >
                            <%=Load.getNumberWinning("bon3", listMN2)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="52153"
                          >
                            <%=Load.getNumberWinning("bon4", listMN2)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="25752"
                          >
                            <%=Load.getNumberWinning("bon5", listMN2)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="42115"
                          >
                            <%=Load.getNumberWinning("bon6", listMN2)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="18329"
                          >
                            <%=Load.getNumberWinning("bon7", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="49459"
                          >
                            <%=Load.getNumberWinning("ba1", listMN2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="83806"
                          >
                            <%=Load.getNumberWinning("ba2", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="63081"
                          >
                            <%=Load.getNumberWinning("nhi", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="11060"
                          >
                            <%=Load.getNumberWinning("nhat", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="324301"
                          >
                            <%=Load.getNumberWinning("db", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMN3 = new Load().getListThirdDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-thuan"
                                  title="Xổ Số  Bình Thuận"
                          ><%=Load.getProvince(Load.getListThirdDmartMN(formattedDate))%><span class="namelong"
                          ></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="84"
                          >
                            <%=Load.getNumberWinning("tam", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="543"
                          >
                            <%=Load.getNumberWinning("bay", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="5199"
                          >
                            <%=Load.getNumberWinning("sau1", listMN3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="3487"
                          >
                            <%=Load.getNumberWinning("sau2", listMN3)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="0079"
                          >
                            <%=Load.getNumberWinning("sau3", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6490"
                          >
                            <%=Load.getNumberWinning("nam", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="03563"
                          >
                            <%=Load.getNumberWinning("bon1", listMN3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="10257"
                          >
                            <%=Load.getNumberWinning("bon2", listMN3)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="24034"
                          >
                            <%=Load.getNumberWinning("bon3", listMN3)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="96851"
                          >
                            <%=Load.getNumberWinning("bon4", listMN3)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="80680"
                          >
                            <%=Load.getNumberWinning("bon5", listMN3)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="35618"
                          >
                            <%=Load.getNumberWinning("bon6", listMN3)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="59392"
                          >
                            <%=Load.getNumberWinning("bon7", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="15881"
                          >
                            <%=Load.getNumberWinning("ba1", listMN3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="87159"
                          >
                            <%=Load.getNumberWinning("ba2", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="51074"
                          >
                            <%=Load.getNumberWinning("nhi", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="38264"
                          >
                            <%=Load.getNumberWinning("nhat", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="092098"
                          >
                            <%=Load.getNumberWinning("db", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <%}else{%>
                <tr>
                  <td>
                    <%List<Dmart> listMN1 = new Load().getListFirstDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-tay-ninh"
                                  title="Xổ Số  Tây Ninh"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListFirstDmartMN(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="30"
                          >
                            <%=Load.getNumberWinning("tam", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="665"
                          >
                            <%=Load.getNumberWinning("bay", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="7081"
                          >
                            <%=Load.getNumberWinning("sau1", listMN1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="5914"
                          >
                            <%=Load.getNumberWinning("sau2", listMN1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="5950"
                          >
                            <%=Load.getNumberWinning("sau3", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="8911"
                          >
                            <%=Load.getNumberWinning("nam", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="49666"
                          >
                            <%=Load.getNumberWinning("bon1", listMN1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="56531"
                          >
                            <%=Load.getNumberWinning("bon2", listMN1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="58811"
                          >
                            <%=Load.getNumberWinning("bon3", listMN1)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="22087"
                          >
                            <%=Load.getNumberWinning("bon4", listMN1)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="33866"
                          >
                            <%=Load.getNumberWinning("bon5", listMN1)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="45173"
                          >
                            <%=Load.getNumberWinning("bon6", listMN1)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="89281"
                          >
                            <%=Load.getNumberWinning("bon7", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="55388"
                          >
                            <%=Load.getNumberWinning("ba1", listMN1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="46257"
                          >
                            <%=Load.getNumberWinning("ba2", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="95488"
                          >
                            <%=Load.getNumberWinning("nhi", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="72056"
                          >
                            <%=Load.getNumberWinning("nhat", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="429638"
                          >
                            <%=Load.getNumberWinning("db", listMN1)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMN2 = new Load().getListSecondDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-an-giang"
                                  title="Xổ Số  An Giang"
                          ><%=Load.getProvince(Load.getListSecondDmartMN(formattedDate))%><span class="namelong"
                          ></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="27"
                          >
                            <%=Load.getNumberWinning("tam", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="545"
                          >
                            <%=Load.getNumberWinning("bay", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="1740"
                          >
                            <%=Load.getNumberWinning("sau1", listMN2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="9424"
                          >
                            <%=Load.getNumberWinning("sau2", listMN2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="6873"
                          >
                            <%=Load.getNumberWinning("sau3", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="4132"
                          >
                            <%=Load.getNumberWinning("nam", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="78741"
                          >
                            <%=Load.getNumberWinning("bon1", listMN2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="21776"
                          >
                            <%=Load.getNumberWinning("bon2", listMN2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="78398"
                          >
                            <%=Load.getNumberWinning("bon3", listMN2)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="52153"
                          >
                            <%=Load.getNumberWinning("bon4", listMN2)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="25752"
                          >
                            <%=Load.getNumberWinning("bon5", listMN2)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="42115"
                          >
                            <%=Load.getNumberWinning("bon6", listMN2)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="18329"
                          >
                            <%=Load.getNumberWinning("bon7", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="49459"
                          >
                            <%=Load.getNumberWinning("ba1", listMN2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="83806"
                          >
                            <%=Load.getNumberWinning("ba2", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="63081"
                          >
                            <%=Load.getNumberWinning("nhi", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="11060"
                          >
                            <%=Load.getNumberWinning("nhat", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="324301"
                          >
                            <%=Load.getNumberWinning("db", listMN2)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMN3 = new Load().getListThirdDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-thuan"
                                  title="Xổ Số  Bình Thuận"
                          ><%=Load.getProvince(Load.getListThirdDmartMN(formattedDate))%><span class="namelong"
                          ></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="84"
                          >
                            <%=Load.getNumberWinning("tam", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="543"
                          >
                            <%=Load.getNumberWinning("bay", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="5199"
                          >
                            <%=Load.getNumberWinning("sau1", listMN3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="3487"
                          >
                            <%=Load.getNumberWinning("sau2", listMN3)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="0079"
                          >
                            <%=Load.getNumberWinning("sau3", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6490"
                          >
                            <%=Load.getNumberWinning("nam", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="03563"
                          >
                            <%=Load.getNumberWinning("bon1", listMN3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="10257"
                          >
                            <%=Load.getNumberWinning("bon2", listMN3)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="24034"
                          >
                            <%=Load.getNumberWinning("bon3", listMN3)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="96851"
                          >
                            <%=Load.getNumberWinning("bon4", listMN3)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="80680"
                          >
                            <%=Load.getNumberWinning("bon5", listMN3)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="35618"
                          >
                            <%=Load.getNumberWinning("bon6", listMN3)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="59392"
                          >
                            <%=Load.getNumberWinning("bon7", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="15881"
                          >
                            <%=Load.getNumberWinning("ba1", listMN3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="87159"
                          >
                            <%=Load.getNumberWinning("ba2", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="51074"
                          >
                            <%=Load.getNumberWinning("nhi", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="38264"
                          >
                            <%=Load.getNumberWinning("nhat", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="092098"
                          >
                            <%=Load.getNumberWinning("db", listMN3)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMN4 = new Load().getListFourthDmartMN(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-thuan"
                                  title="Xổ Số  Bình Thuận"
                          ><%=Load.getProvince(Load.getListFourthDmartMN(formattedDate))%><span class="namelong"
                          ></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="84"
                          >
                            <%=Load.getNumberWinning("tam", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="543"
                          >
                            <%=Load.getNumberWinning("bay", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="5199"
                          >
                            <%=Load.getNumberWinning("sau1", listMN4)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="3487"
                          >
                            <%=Load.getNumberWinning("sau2", listMN4)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="0079"
                          >
                            <%=Load.getNumberWinning("sau3", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6490"
                          >
                            <%=Load.getNumberWinning("nam", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="03563"
                          >
                            <%=Load.getNumberWinning("bon1", listMN4)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="10257"
                          >
                            <%=Load.getNumberWinning("bon2", listMN4)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="24034"
                          >
                            <%=Load.getNumberWinning("bon3", listMN4)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="96851"
                          >
                            <%=Load.getNumberWinning("bon4", listMN4)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="80680"
                          >
                            <%=Load.getNumberWinning("bon5", listMN4)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="35618"
                          >
                            <%=Load.getNumberWinning("bon6", listMN4)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="59392"
                          >
                            <%=Load.getNumberWinning("bon7", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="15881"
                          >
                            <%=Load.getNumberWinning("ba1", listMN4)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="87159"
                          >
                            <%=Load.getNumberWinning("ba2", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="51074"
                          >
                            <%=Load.getNumberWinning("nhi", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="38264"
                          >
                            <%=Load.getNumberWinning("nhat", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="092098"
                          >
                            <%=Load.getNumberWinning("db", listMN4)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <%}%>
                </tbody>
              </table>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="boxBottom" data-id="1-16-11-2023">
      <div class="config_Bangketqua_list">
        <div class="config_Item" data="0">All</div>
        <div class="config_Item" data="2">2 số</div>
        <div class="config_Item" data="3">3 Số</div>
      </div>
      <div class="daysoThongkes">
        <div class="daysoThongke">0</div>
        <div class="daysoThongke">1</div>
        <div class="daysoThongke">2</div>
        <div class="daysoThongke">3</div>
        <div class="daysoThongke">4</div>
        <div class="daysoThongke">5</div>
        <div class="daysoThongke">6</div>
        <div class="daysoThongke">7</div>
        <div class="daysoThongke">8</div>
        <div class="daysoThongke">9</div>
      </div>
    </div>
    <div id="DDM1-16-11-2023"></div>
  </div>
  <%}else if(domain.equals("2")) {%>
  <div class="box_kqxs" id="kqxs_3-16-11-2023">
    <div class="xsmn miennam4cot">
      <div class="tenbkqxs" style="background: #fdbb03 !important;">
        <div class="title">
          <a href="" style="color: black !important"
          >KẾT QUẢ XỔ SỐ Miền Trung<span class="hidemax460">
                              - KQXS MT</span
          ></a
          >
        </div>
        <div class="ngaykqxs">
          <a
                  href="/ket-qua-xo-so/ngay-16-11-2023"
                  title="Click xem KQXS 3 Miền Ngày: 16/11/23"
          ><span class="date"
          ><span class="daymonth"><%=dayMonth%></span
          ><span class="year"><%=year%></span></span
          ></a
          >
        </div>
      </div>
      <div class="top_adv">
        <a
                href="https://ketqua.app"
                target="_blank"
                title="Tải ứng dụng xổ số về điện thoại"
        ><img
                align="absMiddle"
                alt=""
                border="0"
                src="/upload/images/banner/banner-adv-600x60_app_kqxs_xosohomnay.gif"
        /></a>
      </div>
      <div class="kqxs_content">
        <table
                width="100%"
                border="0"
                cellspacing="0"
                cellpadding="0"
        >
          <tbody>
          <tr>
            <td class="leftcl">
              <table
                      width="100%"
                      border="0"
                      cellspacing="0"
                      cellpadding="0"
              >
                <tbody>
                <tr>
                  <td class="thu">
                    <a
                            href=""
                            title=""
                    ></a
                    >
                  </td>
                </tr>
                <tr>
                  <td class="ten_giai_tam">100N</td>
                </tr>
                <tr>
                  <td class="ten_giai_bay">200N</td>
                </tr>
                <tr>
                  <td class="ten_giai_sau">400N</td>
                </tr>
                <tr>
                  <td class="ten_giai_nam">1TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_tu">3TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_ba">10TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_nhi">15TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_nhat">30TR</td>
                </tr>
                <tr>
                  <td class="ten_giai_dac_biet">2Tỷ</td>
                </tr>
                </tbody>
              </table>
            </td>
            <td class="rightcl">
              <table
                      width="100%"
                      border="0"
                      cellspacing="0"
                      cellpadding="0"
              >
                <tbody>
                <%if(Load.getProvince(Load.getListThirdDmartMT(formattedDate)).equals("")){%>
                <tr>
                  <td>
                    <%List<Dmart> listMT1 = new Load().getListFirstDmartMT(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-dinh"
                                  title="Xổ Số  Bình Định"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListFirstDmartMT(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="64"
                          >
                            <%=Load.getNumberWinning("tam", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="233"
                          >
                            <%=Load.getNumberWinning("bay", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="4387"
                          >
                            <%=Load.getNumberWinning("sau1", listMT1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="8047"
                          >
                            <%=Load.getNumberWinning("sau2", listMT1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="1648"
                          >
                            <%=Load.getNumberWinning("sau3", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6506"
                          >
                            <%=Load.getNumberWinning("nam", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="75356"
                          >
                            <%=Load.getNumberWinning("bon1", listMT1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="62304"
                          >
                            <%=Load.getNumberWinning("bon2", listMT1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="50561"
                          >
                            <%=Load.getNumberWinning("bon3", listMT1)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="76215"
                          >
                            <%=Load.getNumberWinning("bon4", listMT1)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="67880"
                          >
                            <%=Load.getNumberWinning("bon5", listMT1)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="60398"
                          >
                            <%=Load.getNumberWinning("bon6", listMT1)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="19087"
                          >
                            <%=Load.getNumberWinning("bon7", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="08177"
                          >
                            <%=Load.getNumberWinning("ba1", listMT1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="93481"
                          >
                            <%=Load.getNumberWinning("ba2", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="59635"
                          >
                            <%=Load.getNumberWinning("nhi", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="28510"
                          >
                            <%=Load.getNumberWinning("nhat", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="835628"
                          >
                            <%=Load.getNumberWinning("db", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMT2 = new Load().getListSecondDmartMT(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-dinh"
                                  title="Xổ Số  Bình Định"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListSecondDmartMT(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="64"
                          >
                            <%=Load.getNumberWinning("tam", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="233"
                          >
                            <%=Load.getNumberWinning("bay", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="4387"
                          >
                            <%=Load.getNumberWinning("sau1", listMT2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="8047"
                          >
                            <%=Load.getNumberWinning("sau2", listMT2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="1648"
                          >
                            <%=Load.getNumberWinning("sau3", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6506"
                          >
                            <%=Load.getNumberWinning("nam", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="75356"
                          >
                            <%=Load.getNumberWinning("bon1", listMT2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="62304"
                          >
                            <%=Load.getNumberWinning("bon2", listMT2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="50561"
                          >
                            <%=Load.getNumberWinning("bon3", listMT2)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="76215"
                          >
                            <%=Load.getNumberWinning("bon4", listMT2)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="67880"
                          >
                            <%=Load.getNumberWinning("bon5", listMT2)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="60398"
                          >
                            <%=Load.getNumberWinning("bon6", listMT2)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="19087"
                          >
                            <%=Load.getNumberWinning("bon7", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="08177"
                          >
                            <%=Load.getNumberWinning("ba1", listMT2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="93481"
                          >
                            <%=Load.getNumberWinning("ba2", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="59635"
                          >
                            <%=Load.getNumberWinning("nhi", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="28510"
                          >
                            <%=Load.getNumberWinning("nhat", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="835628"
                          >
                            <%=Load.getNumberWinning("db", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <%}else{%>
                <tr>
                  <td>
                    <%List<Dmart> listMT1 = new Load().getListFirstDmartMT(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-dinh"
                                  title="Xổ Số  Bình Định"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListFirstDmartMT(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="64"
                          >
                            <%=Load.getNumberWinning("tam", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="233"
                          >
                            <%=Load.getNumberWinning("bay", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="4387"
                          >
                            <%=Load.getNumberWinning("sau1", listMT1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="8047"
                          >
                            <%=Load.getNumberWinning("sau2", listMT1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="1648"
                          >
                            <%=Load.getNumberWinning("sau3", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6506"
                          >
                            <%=Load.getNumberWinning("nam", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="75356"
                          >
                            <%=Load.getNumberWinning("bon1", listMT1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="62304"
                          >
                            <%=Load.getNumberWinning("bon2", listMT1)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="50561"
                          >
                            <%=Load.getNumberWinning("bon3", listMT1)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="76215"
                          >
                            <%=Load.getNumberWinning("bon4", listMT1)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="67880"
                          >
                            <%=Load.getNumberWinning("bon5", listMT1)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="60398"
                          >
                            <%=Load.getNumberWinning("bon6", listMT1)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="19087"
                          >
                            <%=Load.getNumberWinning("bon7", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="08177"
                          >
                            <%=Load.getNumberWinning("ba1", listMT1)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="93481"
                          >
                            <%=Load.getNumberWinning("ba2", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="59635"
                          >
                            <%=Load.getNumberWinning("nhi", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="28510"
                          >
                            <%=Load.getNumberWinning("nhat", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="835628"
                          >
                            <%=Load.getNumberWinning("db", listMT1)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMT2 = new Load().getListSecondDmartMT(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-dinh"
                                  title="Xổ Số  Bình Định"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListSecondDmartMT(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="64"
                          >
                            <%=Load.getNumberWinning("tam", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="233"
                          >
                            <%=Load.getNumberWinning("bay", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="4387"
                          >
                            <%=Load.getNumberWinning("sau1", listMT2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="8047"
                          >
                            <%=Load.getNumberWinning("sau2", listMT2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="1648"
                          >
                            <%=Load.getNumberWinning("sau3", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6506"
                          >
                            <%=Load.getNumberWinning("nam", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="75356"
                          >
                            <%=Load.getNumberWinning("bon1", listMT2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="62304"
                          >
                            <%=Load.getNumberWinning("bon2", listMT2)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="50561"
                          >
                            <%=Load.getNumberWinning("bon3", listMT2)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="76215"
                          >
                            <%=Load.getNumberWinning("bon4", listMT2)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="67880"
                          >
                            <%=Load.getNumberWinning("bon5", listMT2)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="60398"
                          >
                            <%=Load.getNumberWinning("bon6", listMT2)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="19087"
                          >
                            <%=Load.getNumberWinning("bon7", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="08177"
                          >
                            <%=Load.getNumberWinning("ba1", listMT2)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="93481"
                          >
                            <%=Load.getNumberWinning("ba2", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="59635"
                          >
                            <%=Load.getNumberWinning("nhi", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="28510"
                          >
                            <%=Load.getNumberWinning("nhat", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="835628"
                          >
                            <%=Load.getNumberWinning("db", listMT2)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                  <td>
                    <%List<Dmart> listMT3 = new Load().getListThirdDmartMT(formattedDate);%>
                    <table
                            width="100%"
                            border="0"
                            cellspacing="0"
                            cellpadding="0"
                            class="tblKQTinh"
                    >
                      <tbody>
                      <tr>
                        <td class="tentinh">
                          <a
                                  href="/xo-so-binh-dinh"
                                  title="Xổ Số  Bình Định"
                          ><span class="namelong"
                          ><%=Load.getProvince(Load.getListThirdDmartMT(formattedDate))%></span
                          ><span class="nameshort"
                          ></span
                          ></a
                          >
                        </td>
                      </tr>
                      <tr>
                        <td class="loaive"></td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tam">
                          <div
                                  class="lq_1 dayso"
                                  data="64"
                          >
                            <%=Load.getNumberWinning("tam", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_bay">
                          <div
                                  class="lq_1 dayso"
                                  data="233"
                          >
                            <%=Load.getNumberWinning("bay", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_sau">
                          <div
                                  class="lq_1 dayso"
                                  data="4387"
                          >
                            <%=Load.getNumberWinning("sau1", listMT3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="8047"
                          >
                            <%=Load.getNumberWinning("sau2", listMT3)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="1648"
                          >
                            <%=Load.getNumberWinning("sau3", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nam">
                          <div
                                  class="lq_1 dayso"
                                  data="6506"
                          >
                            <%=Load.getNumberWinning("nam", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_tu">
                          <div
                                  class="lq_1 dayso"
                                  data="75356"
                          >
                            <%=Load.getNumberWinning("bon1", listMT3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="62304"
                          >
                            <%=Load.getNumberWinning("bon2", listMT3)%>
                          </div>
                          <div
                                  class="lq_3 dayso"
                                  data="50561"
                          >
                            <%=Load.getNumberWinning("bon3", listMT3)%>
                          </div>
                          <div
                                  class="lq_4 dayso"
                                  data="76215"
                          >
                            <%=Load.getNumberWinning("bon4", listMT3)%>
                          </div>
                          <div
                                  class="lq_5 dayso"
                                  data="67880"
                          >
                            <%=Load.getNumberWinning("bon5", listMT3)%>
                          </div>
                          <div
                                  class="lq_6 dayso"
                                  data="60398"
                          >
                            <%=Load.getNumberWinning("bon6", listMT3)%>
                          </div>
                          <div
                                  class="lq_7 dayso"
                                  data="19087"
                          >
                            <%=Load.getNumberWinning("bon7", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_ba">
                          <div
                                  class="lq_1 dayso"
                                  data="08177"
                          >
                            <%=Load.getNumberWinning("ba1", listMT3)%>
                          </div>
                          <div
                                  class="lq_2 dayso"
                                  data="93481"
                          >
                            <%=Load.getNumberWinning("ba2", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhi">
                          <div
                                  class="lq_1 dayso"
                                  data="59635"
                          >
                            <%=Load.getNumberWinning("nhi", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_nhat">
                          <div
                                  class="lq_1 dayso"
                                  data="28510"
                          >
                            <%=Load.getNumberWinning("nhat", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      <tr align="center">
                        <td class="giai_dac_biet">
                          <div
                                  class="lq_1 dayso"
                                  data="835628"
                          >
                            <%=Load.getNumberWinning("db", listMT3)%>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <%}%>
                </tbody>
              </table>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="boxBottom" data-id="3-16-11-2023">
      <div class="config_Bangketqua_list">
        <div class="config_Item" data="0">All</div>
        <div class="config_Item" data="2">2 số</div>
        <div class="config_Item" data="3">3 Số</div>
      </div>
      <div class="daysoThongkes">
        <div class="daysoThongke">0</div>
        <div class="daysoThongke">1</div>
        <div class="daysoThongke">2</div>
        <div class="daysoThongke">3</div>
        <div class="daysoThongke">4</div>
        <div class="daysoThongke">5</div>
        <div class="daysoThongke">6</div>
        <div class="daysoThongke">7</div>
        <div class="daysoThongke">8</div>
        <div class="daysoThongke">9</div>
      </div>
    </div>
    <div id="DDM3-16-11-2023"></div>
  </div>
  <%}else if(domain.equals("3")) {%>
  <div class="box_kqxs" id="kqxs_2-16-11-2023">
    <div class="xsmb">
      <div class="tenbkqxs" style="background: #fdbb03 !important;">
        <div class="ngaykqxs">
          <a
                  href="/ket-qua-xo-so/ngay-16-11-2023"
                  title="Click xem KQXS 3 Miền Ngày: 16/11/23"
          ><span class="date"
          ><span class="daymonth"><%=dayMonth%></span
          ><span class="year"><%=year%></span></span
          ></a
          >
        </div>
        <div class="title">
          <a href="/truc-tiep-xo-so-mien-bac-xstt-mb-xsmb" style="color: black !important"
          >KẾT QUẢ XỔ SỐ Miền Bắc<span class="hidemax460">
                              - KQXS MB</span
          ></a
          >
        </div>
      </div>
      <div class="top_adv">
        <a
                href="https://ketqua.app"
                target="_blank"
                title="Tải ứng dụng xổ số về điện thoại"
        ><img
                align="absMiddle"
                alt=""
                border="0"
                src="/upload/images/banner/banner-adv-600x60_app_kqxs_xosohomnay.gif"
        /></a>
      </div>
      <div class="kqxs_content">
        <%
          List<Dmart> listMB = new Load().getListDmartMB(formattedDate);
          String num = Load.getNumberWinningMB("db", listMB);
          String[] parts = num.split("\\s+", 2);
          String number = parts[0];
          String kytu = parts[1];%>
        <table
                width="100%"
                border="0"
                cellpadding="0"
                cellspacing="0"
        >
          <tbody>
          <tr>
            <td class="thu">
              <a
                      href=""
                      title=""
              ></a
              >
            </td>
            <td class="tentinh">
                                <span class="phathanh"
                                ><a href="/xo-so-ha-noi" title="Xổ Số  Hà Nội"
                                ><%=Load.getProvince(Load.getListDmartMB(formattedDate))%></a
                                ></span
                                >
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_dac_biet">ĐB</td>
            <td class="giai_dac_biet">
              <div class="giaiDbmoi">
                                  <span class="kyhieuDB kyhieuDB1ve"
                                  ><span><%=kytu%></span></span
                                  >
                <div class="lq_1 dayso" data="54869">
                  <%=number%>
                </div>
              </div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_nhat">G.Nhất</td>
            <td class="giai_nhat">
              <div class="lq_1 dayso" data="34677"><%=Load.getNumberWinningMB("nhat", listMB)%></div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_nhi">G.Nhì</td>
            <td class="giai_nhi">
              <div class="lq_1 dayso" data="80583"><%=Load.getNumberWinningMB("nhi1", listMB)%></div>
              <div class="lq_2 dayso" data="17410"><%=Load.getNumberWinningMB("nhi2", listMB)%></div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_ba">G.Ba</td>
            <td class="giai_ba">
              <div class="lq_1 dayso" data="12119"><%=Load.getNumberWinningMB("ba1", listMB)%></div>
              <div class="lq_2 dayso" data="75379"><%=Load.getNumberWinningMB("ba2", listMB)%></div>
              <div class="lq_3 dayso" data="69729"><%=Load.getNumberWinningMB("ba3", listMB)%></div>
              <div class="lq_4 dayso" data="45196"><%=Load.getNumberWinningMB("ba4", listMB)%></div>
              <div class="lq_5 dayso" data="06463"><%=Load.getNumberWinningMB("ba5", listMB)%></div>
              <div class="lq_6 dayso" data="06180"><%=Load.getNumberWinningMB("ba6", listMB)%></div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_tu">G.Tư</td>
            <td class="giai_tu">
              <div class="lq_1 dayso" data="9936"><%=Load.getNumberWinningMB("bon1", listMB)%></div>
              <div class="lq_2 dayso" data="0565"><%=Load.getNumberWinningMB("bon2", listMB)%></div>
              <div class="lq_3 dayso" data="5964"><%=Load.getNumberWinningMB("bon3", listMB)%></div>
              <div class="lq_4 dayso" data="1109"><%=Load.getNumberWinningMB("bon4", listMB)%></div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_nam">G.Năm</td>
            <td class="giai_nam">
              <div class="lq_1 dayso" data="7356"><%=Load.getNumberWinningMB("nam1", listMB)%></div>
              <div class="lq_2 dayso" data="9273"><%=Load.getNumberWinningMB("nam2", listMB)%></div>
              <div class="lq_3 dayso" data="1879"><%=Load.getNumberWinningMB("nam3", listMB)%></div>
              <div class="lq_4 dayso" data="6015"><%=Load.getNumberWinningMB("nam4", listMB)%></div>
              <div class="lq_5 dayso" data="4125"><%=Load.getNumberWinningMB("nam5", listMB)%></div>
              <div class="lq_6 dayso" data="3336"><%=Load.getNumberWinningMB("nam6", listMB)%></div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_sau">G.Sáu</td>
            <td class="giai_sau">
              <div class="lq_1 dayso" data="959"><%=Load.getNumberWinningMB("sau1", listMB)%></div>
              <div class="lq_2 dayso" data="344"><%=Load.getNumberWinningMB("sau2", listMB)%></div>
              <div class="lq_3 dayso" data="804"><%=Load.getNumberWinningMB("sau3", listMB)%></div>
            </td>
          </tr>
          <tr align="center">
            <td class="ten_giai_bay">G.Bảy</td>
            <td class="giai_bay">
              <div class="lq_1 dayso" data="36"><%=Load.getNumberWinningMB("bay1", listMB)%></div>
              <div class="lq_2 dayso" data="20"><%=Load.getNumberWinningMB("bay2", listMB)%></div>
              <div class="lq_3 dayso" data="73"><%=Load.getNumberWinningMB("bay3", listMB)%></div>
              <div class="lq_4 dayso" data="21"><%=Load.getNumberWinningMB("bay4", listMB)%></div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="boxBottom" data-id="2-16-11-2023">
      <div class="config_Bangketqua_list">
        <div class="config_Item" data="0">All</div>
        <div class="config_Item" data="2">2 số</div>
        <div class="config_Item" data="3">3 Số</div>
      </div>
      <div class="daysoThongkes">
        <div class="daysoThongke">0</div>
        <div class="daysoThongke">1</div>
        <div class="daysoThongke">2</div>
        <div class="daysoThongke">3</div>
        <div class="daysoThongke">4</div>
        <div class="daysoThongke">5</div>
        <div class="daysoThongke">6</div>
        <div class="daysoThongke">7</div>
        <div class="daysoThongke">8</div>
        <div class="daysoThongke">9</div>
      </div>
    </div>
    <div id="DDM2-16-11-2023"></div>
  </div>
  <%}%>
  <div></div>
</div>
<script src="https://www.xosohomnay.com.vn/template/jquery/jquery-3.6.0.min.js"></script>
<script src="https://www.xosohomnay.com.vn/template/jquery-ui-1.13.1.sunny/jquery-ui.min.js"></script>
<link
        href="https://www.xosohomnay.com.vn/template/jquery-ui-1.13.1.sunny/jquery-ui.min.css"
        rel="stylesheet"
        type="text/css"
/>
<script
        type="text/javascript"
        src="https://www.xosohomnay.com.vn/template/jquery/jquery.fullscreen-0.4.2.min.js"
></script>
<script
        type="text/javascript"
        src="https://www.xosohomnay.com.vn/template/jquery/sounds/ion.sound.min.js"
></script>
<script
        async=""
        type="text/javascript"
        src="https://www.xosohomnay.com.vn/template/scripts/lazysizes.min.js"
></script>
<script
        async=""
        src="https://www.xosohomnay.com.vn/template/temp/xoso_111.js"
></script>
