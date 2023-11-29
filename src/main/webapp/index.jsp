<%@ page import="Bean.Dmart" %>
<%@ page import="ETL.Load" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>XoSoHomNay</title>
    <link rel="stylesheet" href="./css/style.css" />
</head>
<body class="pagebody">
<div class="playout">
    <div id="header">
        <div class="pcontent">
            <div class="h_banner">
                <div class="logo">
                    <p>
                        <a href="/"
                        ><img
                                alt=""
                                border="0"
                                height="60"
                                hspace="0"
                                src="Images/mainpic.png"
                                vspace="0"
                        /></a>
                    </p>
                </div>
                <div class="header_ext">
                    <div class="boxdoveso">
                        <div>
                            <form
                                    id="doveso"
                                    name="doveso"
                                    method="get"
                                    action="/do-ve-so.html"
                                    onsubmit="return dove();"
                            >
                                <table border="0" cellpadding="0" cellspacing="10">
                                    <tbody>
                                    <tr>
                                        <td align="left" valign="bottom" nowrap="nowrap">
                                            <input
                                                    name="ngay"
                                                    type="text"
                                                    id="frm_dove_ngay"
                                                    readonly="readonly"
                                                    value="16-11-2023"
                                                    class="hasDatepicker"
                                            />
                                        </td>
                                        <td align="left" valign="bottom" nowrap="nowrap">
                                            <select
                                                    name="tinh"
                                                    id="frm_dove_tinh"
                                                    style="width: 130px"
                                            >
                                                <option value="0">Chọn tỉnh</option>
                                            </select>
                                        </td>
                                        <td align="left" valign="bottom" nowrap="nowrap">
                                            <input
                                                    name="so"
                                                    type="text"
                                                    id="doveso_so"
                                                    placeholder="Nhập số"
                                                    onkeyup="convert(this);"
                                                    size="10"
                                                    maxlength="6"
                                                    value=""
                                            />
                                        </td>
                                        <td align="left" valign="bottom" nowrap="nowrap">
                                            <input
                                                    type="submit"
                                                    class="btndoveso"
                                                    value="Dò KQ"
                                            />
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                            <script language="javascript">
                                delay_starboxdoveso = setInterval(function () {
                                    if (window.jQuery) {
                                        st_doveso();
                                        clearInterval(delay_starboxdoveso);
                                    }
                                }, 300);
                            </script>
                        </div>
                    </div>
                </div>
                <div id="MobileMenuIcon">
                    <a href="#">Menu<span></span><span></span><span></span></a>
                </div>
            </div>
        </div>
    </div>
    <div id="navbar" class="navbar">
        <div class="pcontent">
            <div id="cssmenu">
                <ul>
                    <li class="has-sub">
                        <a href="#"><span>Xổ Số Trực Tiếp</span></a>
                    </li>
                    <li class="has-sub">
                        <a href="/ket-qua-xo-so"><span>Kết Quả Xổ Số</span></a>
                    </li>

                    <li class="has-sub">
                        <a href="/so-dau-duoi-mien-nam"><span>Sớ Đầu Đuôi</span></a>
                    </li>
                    <li class="has-sub">
                        <a href="/thong-ke-xo-so"><span>Thống Kê Xổ Số</span></a>
                    </li>
                    <li class="has-sub">
                        <a href="/in-ve-do"><span>In Vé Dò</span></a>
                    </li>
                    <li>
                        <a href="/so-mo"><span>Sổ Mơ</span></a>
                    </li>
                    <li class="menulast">
                        <a href="/blog"><span>Blog</span></a>
                    </li>
                </ul>
            </div>
            <div class="topbarmenu hidemin720">
                <ul id="topmenubar">
                    <li>
                        <a
                                href="/truc-tiep-xo-so-mien-nam-xstt-mn-xsmn"
                                title="Xổ Số Miền Nam"
                        >XSMN</a
                        >
                    </li>
                    <li>
                        <a
                                href="/truc-tiep-xo-so-mien-trung-xstt-mt-xsmt"
                                title="Xổ Số Miền Trung"
                        >XSMT</a
                        >
                    </li>
                    <li>
                        <a
                                href="/truc-tiep-xo-so-mien-bac-xstt-mb-xsmb"
                                title="Xổ Số Miền Bắc"
                        >XSMB</a
                        >
                    </li>
                    <li>
                        <a href="/xo-so-mega-645" title="Xổ Số Mega 6/45">Mega</a>
                    </li>
                    <li><a href="/xo-so-keno" title="Xổ Số Keno">Keno</a></li>
                    <li class="hidemax320">
                        <a href="/xo-so-power-655" title="Xổ Số Power 6/55">Power</a>
                    </li>
                    <!-- <li class="hidemax360"><a href="/do-ve-so.html" title="Dò Vé Số">Dò<span class="hidemax375"> Vé</span></a></li> -->
                </ul>
            </div>
        </div>
    </div>
    <%String date = Load.getCurrentDate();
        int indexOfLastSlash = date.lastIndexOf("/");
        String dayMonth = date.substring(0, indexOfLastSlash);
        String year = date.substring(indexOfLastSlash + 1);%>
    <div id="main">
        <div class="pcontent">
            <div class="dnw-content-top">
                <div class="hidemax720">
                    <div class="hidemax720"></div>
                    <div class="hidemin720"></div>
                </div>
                <div class="dnw-content-main" id="dnw-content-main">
                    <div id="contentmodule">
                        <div class="mainbody" id="pagecontent">
                            <div id="page_content">
                                <h1 class="pagetitle" style="font-size: 30px">
                                    KẾT QUẢ XỔ SỐ MỚI NHẤT
                                </h1>
                                <h1 class="pagetitle1" style="font-size: 30px">
                                    NGÀY <%=Load.getCurrentDate()%>
                                </h1>
                                <div></div>
                                <div class="box_kqxs" id="kqxs_1-16-11-2023">
                                    <div class="xsmn miennam4cot">
                                        <div class="tenbkqxs">
                                            <div class="title">
                                                <a href="/truc-tiep-xo-so-mien-nam-xstt-mn-xsmn"
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
                                                            <%if(Load.getProvince(Load.getListFourthDmartMN()).equals("")){%>
                                                            <tr>
                                                                <td>
                                                                    <%List<Dmart> listMN1 = new Load().getListFirstDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListFirstDmartMN())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">11K3</td>
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
                                                                    <%List<Dmart> listMN2 = new Load().getListSecondDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListSecondDmartMN())%><span class="namelong"
                                                                                ></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">AG-11K3</td>
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
                                                                    <%List<Dmart> listMN3 = new Load().getListThirdDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListThirdDmartMN())%><span class="namelong"
                                                                                ></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">11K3</td>
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
                                                                    <%List<Dmart> listMN1 = new Load().getListFirstDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListFirstDmartMN())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">11K3</td>
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
                                                                    <%List<Dmart> listMN2 = new Load().getListSecondDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListSecondDmartMN())%><span class="namelong"
                                                                                ></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">AG-11K3</td>
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
                                                                    <%List<Dmart> listMN3 = new Load().getListThirdDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListThirdDmartMN())%><span class="namelong"
                                                                                ></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">11K3</td>
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
                                                                    <%List<Dmart> listMN4 = new Load().getListFourthDmartMN();%>
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
                                                                                ><%=Load.getProvince(Load.getListFourthDmartMN())%><span class="namelong"
                                                                                ></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">11K3</td>
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

                                <div class="clear"></div>
                                <div class="adv_foterkqxs"><div class="clear"></div></div>
                                <div class="box_kqxs" id="kqxs_3-16-11-2023">
                                    <div class="xsmn miennam4cot">
                                        <div class="tenbkqxs">
                                            <div class="title">
                                                <a href="/truc-tiep-xo-so-mien-trung-xstt-mt-xsmt"
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
                                                            <%if(Load.getProvince(Load.getListThirdDmartMT()).equals("")){%>
                                                            <tr>
                                                                <td>
                                                                    <%List<Dmart> listMT1 = new Load().getListFirstDmartMT();%>
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
                                                                                ><%=Load.getProvince(Load.getListFirstDmartMT())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSBDI</td>
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
                                                                    <%List<Dmart> listMT2 = new Load().getListSecondDmartMT();%>
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
                                                                                ><%=Load.getProvince(Load.getListSecondDmartMT())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSBDI</td>
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
                                                                    <%List<Dmart> listMT1 = new Load().getListFirstDmartMT();%>
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
                                                                                ><%=Load.getProvince(Load.getListFirstDmartMT())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSBDI</td>
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
                                                                    <%List<Dmart> listMT2 = new Load().getListSecondDmartMT();%>
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
                                                                                ><%=Load.getProvince(Load.getListSecondDmartMT())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSBDI</td>
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
                                                                    <%List<Dmart> listMT3 = new Load().getListThirdDmartMT();%>
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
                                                                                ><%=Load.getProvince(Load.getListThirdDmartMT())%></span
                                                                                ><span class="nameshort"
                                                                                ></span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSBDI</td>
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

                                <div class="clear"></div>
                                <div class="adv_foterkqxs"><div class="clear"></div></div>
                                <div class="box_kqxs" id="kqxs_2-16-11-2023">
                                    <div class="xsmb">
                                        <div class="tenbkqxs">
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
                                                <a href="/truc-tiep-xo-so-mien-bac-xstt-mb-xsmb"
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
                                            <%List<Dmart> listMB = new Load().getListDmartMB();
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
                                ><%=Load.getProvince(Load.getListDmartMB())%></a
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

                                <div></div>
                            </div>
                        </div>
                    </div>
                    <div id="leftmodule">
                        <div class="modulesLR black">
                            <h2 class="mdtitle">Tường Thuật Trực Tiếp</h2>
                            <div class="mdcontent">
                                <ul class="menu2 menuxosott">
                                    <li>
                                        <a
                                                href="/truc-tiep-xo-so-mien-nam-xstt-mn-xsmn"
                                                title="Trực Tiếp Xổ Số Miền Nam"
                                        ><span id="mnxstt_mien-nam" class="icon finnish"
                                        >Xổ Số Miền Nam</span
                                        ></a
                                        >
                                    </li>
                                    <li>
                                        <a
                                                href="/truc-tiep-xo-so-mien-trung-xstt-mt-xsmt"
                                                title="Trực Tiếp Xổ Số Miền Trung"
                                        ><span id="mnxstt_mien-trung" class="icon finnish"
                                        >Xổ Số Miền Trung</span
                                        ></a
                                        >
                                    </li>
                                    <li>
                                        <a
                                                href="/truc-tiep-xo-so-mien-bac-xstt-mb-xsmb"
                                                title="Trực Tiếp Xổ Số Miền Bắc"
                                        ><span id="mnxstt_mien-bac" class="icon finnish"
                                        >Xổ Số Miền Bắc</span
                                        ></a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="hidemax720"></div>
                    </div>
                    <div id="rightmodule">
                        <div id="datepickerl" class="hasDatepicker">
                            <div
                                    class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"
                                    style="display: block"
                            >
                                <div
                                        class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"
                                >
                                    <a
                                            class="ui-datepicker-prev ui-corner-all"
                                            data-handler="prev"
                                            data-event="click"
                                            title="Prev"
                                    ><span class="ui-icon ui-icon-circle-triangle-w"
                                    >Prev</span
                                    ></a
                                    ><a
                                        class="ui-datepicker-next ui-corner-all ui-state-disabled"
                                        title="Next"
                                ><span class="ui-icon ui-icon-circle-triangle-e"
                                >Next</span
                                ></a
                                >
                                    <div class="ui-datepicker-title">
                      <span class="ui-datepicker-month">November</span
                      >&nbsp;<span class="ui-datepicker-year">2023</span>
                                    </div>
                                </div>
                                <table class="ui-datepicker-calendar">
                                    <thead>
                                    <tr>
                                        <th scope="col" class="ui-datepicker-week-end">
                                            <span title="Sunday">Su</span>
                                        </th>
                                        <th scope="col"><span title="Monday">Mo</span></th>
                                        <th scope="col"><span title="Tuesday">Tu</span></th>
                                        <th scope="col"><span title="Wednesday">We</span></th>
                                        <th scope="col"><span title="Thursday">Th</span></th>
                                        <th scope="col"><span title="Friday">Fr</span></th>
                                        <th scope="col" class="ui-datepicker-week-end">
                                            <span title="Saturday">Sa</span>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td
                                                class="ui-datepicker-week-end ui-datepicker-other-month"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="9"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default ui-priority-secondary"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="29"
                                            >29</a
                                            >
                                        </td>
                                        <td
                                                class="ui-datepicker-other-month"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="9"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default ui-priority-secondary"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="30"
                                            >30</a
                                            >
                                        </td>
                                        <td
                                                class="ui-datepicker-other-month"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="9"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default ui-priority-secondary"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="31"
                                            >31</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="1"
                                            >1</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="2"
                                            >2</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="3"
                                            >3</a
                                            >
                                        </td>
                                        <td
                                                class="ui-datepicker-week-end"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="4"
                                            >4</a
                                            >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td
                                                class="ui-datepicker-week-end"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="5"
                                            >5</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="6"
                                            >6</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="7"
                                            >7</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="8"
                                            >8</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="9"
                                            >9</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="10"
                                            >10</a
                                            >
                                        </td>
                                        <td
                                                class="ui-datepicker-week-end"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="11"
                                            >11</a
                                            >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td
                                                class="ui-datepicker-week-end"
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="12"
                                            >12</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="13"
                                            >13</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="14"
                                            >14</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="15"
                                            >15</a
                                            >
                                        </td>
                                        <td
                                                class=" "
                                                data-handler="selectDay"
                                                data-event="click"
                                                data-month="10"
                                                data-year="2023"
                                        >
                                            <a
                                                    class="ui-state-default"
                                                    href="#"
                                                    aria-current="false"
                                                    data-date="15"
                                            >16</a
                                            >
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">17</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">18</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td
                                                class="ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">19</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">20</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">21</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">22</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">23</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">24</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">25</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td
                                                class="ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">26</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">27</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">28</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">29</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">30</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">1</span>
                                        </td>
                                        <td
                                                class="ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled"
                                        >
                                            <span class="ui-state-default">2</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <p style="text-align: center">
                            <a
                                    href="https://www.youtube.com/c/XoSoHomNay?sub_confirmation=1"
                                    target="_blank"
                            ><img
                                    align="absMiddle"
                                    alt="Subscribe Xổ Số Minh Ngọc"
                                    border="0"
                                    height="169"
                                    hspace="0"
                                    src="https://www.xosohomnay.com.vn/upload/images/icons/youtube-xshn.jpg"
                                    vspace="0"
                                    width="300"
                            /></a>
                        </p>
                        <div class="clear"></div>
                        <div class="hidemax1000"></div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script
            async=""
            src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
    ></script>
    <script
            async=""
            src="https://www.googletagmanager.com/gtag/js?id=G-R1KFRQFBR2"
    ></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() {
            dataLayer.push(arguments);
        }
        gtag("js", new Date());
        gtag("config", "G-R1KFRQFBR2");
    </script>
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
    <div
            id="ui-datepicker-div"
            class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"
    ></div>
</div>
</body>
</html>
