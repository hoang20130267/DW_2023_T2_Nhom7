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
                                    NGÀY
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
                                                ><span class="daymonth">16/11</span
                                                ><span class="year">2023</span></span
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
                                                            <tr>
                                                                <td>
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
                                                                                >Tây Ninh</span
                                                                                ><span class="nameshort"
                                                                                >T.Ninh</span
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
                                                                                    30
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_bay">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="665"
                                                                                >
                                                                                    665
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_sau">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="7081"
                                                                                >
                                                                                    7081
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="5914"
                                                                                >
                                                                                    5914
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="5950"
                                                                                >
                                                                                    5950
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="8911"
                                                                                >
                                                                                    8911
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tu">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="49666"
                                                                                >
                                                                                    49666
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="56531"
                                                                                >
                                                                                    56531
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="58811"
                                                                                >
                                                                                    58811
                                                                                </div>
                                                                                <div
                                                                                        class="lq_4 dayso"
                                                                                        data="22087"
                                                                                >
                                                                                    22087
                                                                                </div>
                                                                                <div
                                                                                        class="lq_5 dayso"
                                                                                        data="33866"
                                                                                >
                                                                                    33866
                                                                                </div>
                                                                                <div
                                                                                        class="lq_6 dayso"
                                                                                        data="45173"
                                                                                >
                                                                                    45173
                                                                                </div>
                                                                                <div
                                                                                        class="lq_7 dayso"
                                                                                        data="89281"
                                                                                >
                                                                                    89281
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_ba">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="55388"
                                                                                >
                                                                                    55388
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="46257"
                                                                                >
                                                                                    46257
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhi">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="95488"
                                                                                >
                                                                                    95488
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhat">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="72056"
                                                                                >
                                                                                    72056
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_dac_biet">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="429638"
                                                                                >
                                                                                    429638
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td>
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
                                                                                ><span class="namelong"
                                                                                >An Giang</span
                                                                                ><span class="nameshort"
                                                                                >A.Giang</span
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
                                                                                    27
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_bay">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="545"
                                                                                >
                                                                                    545
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_sau">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="1740"
                                                                                >
                                                                                    1740
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="9424"
                                                                                >
                                                                                    9424
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="6873"
                                                                                >
                                                                                    6873
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="4132"
                                                                                >
                                                                                    4132
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tu">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="78741"
                                                                                >
                                                                                    78741
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="21776"
                                                                                >
                                                                                    21776
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="78398"
                                                                                >
                                                                                    78398
                                                                                </div>
                                                                                <div
                                                                                        class="lq_4 dayso"
                                                                                        data="52153"
                                                                                >
                                                                                    52153
                                                                                </div>
                                                                                <div
                                                                                        class="lq_5 dayso"
                                                                                        data="25752"
                                                                                >
                                                                                    25752
                                                                                </div>
                                                                                <div
                                                                                        class="lq_6 dayso"
                                                                                        data="42115"
                                                                                >
                                                                                    42115
                                                                                </div>
                                                                                <div
                                                                                        class="lq_7 dayso"
                                                                                        data="18329"
                                                                                >
                                                                                    18329
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_ba">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="49459"
                                                                                >
                                                                                    49459
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="83806"
                                                                                >
                                                                                    83806
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhi">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="63081"
                                                                                >
                                                                                    63081
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhat">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="11060"
                                                                                >
                                                                                    11060
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_dac_biet">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="324301"
                                                                                >
                                                                                    324301
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td>
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
                                                                                ><span class="namelong"
                                                                                >Bình Thuận</span
                                                                                ><span class="nameshort"
                                                                                >B.Thuận</span
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
                                                                                    84
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_bay">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="543"
                                                                                >
                                                                                    543
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_sau">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="5199"
                                                                                >
                                                                                    5199
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="3487"
                                                                                >
                                                                                    3487
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="0079"
                                                                                >
                                                                                    0079
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="6490"
                                                                                >
                                                                                    6490
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tu">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="03563"
                                                                                >
                                                                                    03563
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="10257"
                                                                                >
                                                                                    10257
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="24034"
                                                                                >
                                                                                    24034
                                                                                </div>
                                                                                <div
                                                                                        class="lq_4 dayso"
                                                                                        data="96851"
                                                                                >
                                                                                    96851
                                                                                </div>
                                                                                <div
                                                                                        class="lq_5 dayso"
                                                                                        data="80680"
                                                                                >
                                                                                    80680
                                                                                </div>
                                                                                <div
                                                                                        class="lq_6 dayso"
                                                                                        data="35618"
                                                                                >
                                                                                    35618
                                                                                </div>
                                                                                <div
                                                                                        class="lq_7 dayso"
                                                                                        data="59392"
                                                                                >
                                                                                    59392
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_ba">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="15881"
                                                                                >
                                                                                    15881
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="87159"
                                                                                >
                                                                                    87159
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhi">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="51074"
                                                                                >
                                                                                    51074
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhat">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="38264"
                                                                                >
                                                                                    38264
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_dac_biet">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="092098"
                                                                                >
                                                                                    092098
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
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
                                                ><span class="daymonth">16/11</span
                                                ><span class="year">2023</span></span
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
                                                            <tr>
                                                                <td>
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
                                                                                >Bình Định</span
                                                                                ><span class="nameshort"
                                                                                >B.Định</span
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
                                                                                    64
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_bay">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="233"
                                                                                >
                                                                                    233
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_sau">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="4387"
                                                                                >
                                                                                    4387
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="8047"
                                                                                >
                                                                                    8047
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="1648"
                                                                                >
                                                                                    1648
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="6506"
                                                                                >
                                                                                    6506
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tu">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="75356"
                                                                                >
                                                                                    75356
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="62304"
                                                                                >
                                                                                    62304
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="50561"
                                                                                >
                                                                                    50561
                                                                                </div>
                                                                                <div
                                                                                        class="lq_4 dayso"
                                                                                        data="76215"
                                                                                >
                                                                                    76215
                                                                                </div>
                                                                                <div
                                                                                        class="lq_5 dayso"
                                                                                        data="67880"
                                                                                >
                                                                                    67880
                                                                                </div>
                                                                                <div
                                                                                        class="lq_6 dayso"
                                                                                        data="60398"
                                                                                >
                                                                                    60398
                                                                                </div>
                                                                                <div
                                                                                        class="lq_7 dayso"
                                                                                        data="19087"
                                                                                >
                                                                                    19087
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_ba">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="08177"
                                                                                >
                                                                                    08177
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="93481"
                                                                                >
                                                                                    93481
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhi">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="59635"
                                                                                >
                                                                                    59635
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhat">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="28510"
                                                                                >
                                                                                    28510
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_dac_biet">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="835628"
                                                                                >
                                                                                    835628
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td>
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
                                                                                        href="/xo-so-quang-tri"
                                                                                        title="Xổ Số  Quảng Trị"
                                                                                ><span class="namelong"
                                                                                >Quảng Trị</span
                                                                                ><span class="nameshort"
                                                                                >Q.Trị</span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSQT</td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="49"
                                                                                >
                                                                                    49
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_bay">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="157"
                                                                                >
                                                                                    157
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_sau">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="8551"
                                                                                >
                                                                                    8551
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="8676"
                                                                                >
                                                                                    8676
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="7613"
                                                                                >
                                                                                    7613
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="8507"
                                                                                >
                                                                                    8507
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tu">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="25758"
                                                                                >
                                                                                    25758
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="62138"
                                                                                >
                                                                                    62138
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="40167"
                                                                                >
                                                                                    40167
                                                                                </div>
                                                                                <div
                                                                                        class="lq_4 dayso"
                                                                                        data="99334"
                                                                                >
                                                                                    99334
                                                                                </div>
                                                                                <div
                                                                                        class="lq_5 dayso"
                                                                                        data="16754"
                                                                                >
                                                                                    16754
                                                                                </div>
                                                                                <div
                                                                                        class="lq_6 dayso"
                                                                                        data="73899"
                                                                                >
                                                                                    73899
                                                                                </div>
                                                                                <div
                                                                                        class="lq_7 dayso"
                                                                                        data="58211"
                                                                                >
                                                                                    58211
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_ba">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="97098"
                                                                                >
                                                                                    97098
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="40581"
                                                                                >
                                                                                    40581
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhi">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="40496"
                                                                                >
                                                                                    40496
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhat">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="70731"
                                                                                >
                                                                                    70731
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_dac_biet">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="983396"
                                                                                >
                                                                                    983396
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td>
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
                                                                                        href="/xo-so-quang-binh"
                                                                                        title="Xổ Số  Quảng Bình"
                                                                                ><span class="namelong"
                                                                                >Quảng Bình</span
                                                                                ><span class="nameshort"
                                                                                >Q.Bình</span
                                                                                ></a
                                                                                >
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="loaive">XSQB</td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="45"
                                                                                >
                                                                                    45
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_bay">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="195"
                                                                                >
                                                                                    195
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_sau">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="6941"
                                                                                >
                                                                                    6941
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="8501"
                                                                                >
                                                                                    8501
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="6361"
                                                                                >
                                                                                    6361
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nam">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="6911"
                                                                                >
                                                                                    6911
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_tu">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="79109"
                                                                                >
                                                                                    79109
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="87469"
                                                                                >
                                                                                    87469
                                                                                </div>
                                                                                <div
                                                                                        class="lq_3 dayso"
                                                                                        data="04432"
                                                                                >
                                                                                    04432
                                                                                </div>
                                                                                <div
                                                                                        class="lq_4 dayso"
                                                                                        data="35625"
                                                                                >
                                                                                    35625
                                                                                </div>
                                                                                <div
                                                                                        class="lq_5 dayso"
                                                                                        data="16971"
                                                                                >
                                                                                    16971
                                                                                </div>
                                                                                <div
                                                                                        class="lq_6 dayso"
                                                                                        data="42720"
                                                                                >
                                                                                    42720
                                                                                </div>
                                                                                <div
                                                                                        class="lq_7 dayso"
                                                                                        data="28767"
                                                                                >
                                                                                    28767
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_ba">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="41513"
                                                                                >
                                                                                    41513
                                                                                </div>
                                                                                <div
                                                                                        class="lq_2 dayso"
                                                                                        data="56764"
                                                                                >
                                                                                    56764
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhi">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="75558"
                                                                                >
                                                                                    75558
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_nhat">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="16798"
                                                                                >
                                                                                    16798
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr align="center">
                                                                            <td class="giai_dac_biet">
                                                                                <div
                                                                                        class="lq_1 dayso"
                                                                                        data="249035"
                                                                                >
                                                                                    249035
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
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
                                                ><span class="daymonth">16/11</span
                                                ><span class="year">2023</span></span
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
                                >Hà Nội</a
                                ></span
                                >
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_dac_biet">ĐB</td>
                                                    <td class="giai_dac_biet">
                                                        <div class="giaiDbmoi">
                                  <span class="kyhieuDB kyhieuDB1ve"
                                  ><span>12-17-11-9-8-15-5-14BS</span></span
                                  >
                                                            <div class="lq_1 dayso" data="54869">
                                                                54869
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_nhat">G.Nhất</td>
                                                    <td class="giai_nhat">
                                                        <div class="lq_1 dayso" data="34677">34677</div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_nhi">G.Nhì</td>
                                                    <td class="giai_nhi">
                                                        <div class="lq_1 dayso" data="80583">80583</div>
                                                        <div class="lq_2 dayso" data="17410">17410</div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_ba">G.Ba</td>
                                                    <td class="giai_ba">
                                                        <div class="lq_1 dayso" data="12119">12119</div>
                                                        <div class="lq_2 dayso" data="75379">75379</div>
                                                        <div class="lq_3 dayso" data="69729">69729</div>
                                                        <div class="lq_4 dayso" data="45196">45196</div>
                                                        <div class="lq_5 dayso" data="06463">06463</div>
                                                        <div class="lq_6 dayso" data="06180">06180</div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_tu">G.Tư</td>
                                                    <td class="giai_tu">
                                                        <div class="lq_1 dayso" data="9936">9936</div>
                                                        <div class="lq_2 dayso" data="0565">0565</div>
                                                        <div class="lq_3 dayso" data="5964">5964</div>
                                                        <div class="lq_4 dayso" data="1109">1109</div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_nam">G.Năm</td>
                                                    <td class="giai_nam">
                                                        <div class="lq_1 dayso" data="7356">7356</div>
                                                        <div class="lq_2 dayso" data="9273">9273</div>
                                                        <div class="lq_3 dayso" data="1879">1879</div>
                                                        <div class="lq_4 dayso" data="6015">6015</div>
                                                        <div class="lq_5 dayso" data="4125">4125</div>
                                                        <div class="lq_6 dayso" data="3336">3336</div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_sau">G.Sáu</td>
                                                    <td class="giai_sau">
                                                        <div class="lq_1 dayso" data="959">959</div>
                                                        <div class="lq_2 dayso" data="344">344</div>
                                                        <div class="lq_3 dayso" data="804">804</div>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td class="ten_giai_bay">G.Bảy</td>
                                                    <td class="giai_bay">
                                                        <div class="lq_1 dayso" data="36">36</div>
                                                        <div class="lq_2 dayso" data="20">20</div>
                                                        <div class="lq_3 dayso" data="73">73</div>
                                                        <div class="lq_4 dayso" data="21">21</div>
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
