<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的闲置</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/emoji.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/user.css"/>
    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>


</head>
<body>
<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif"
         class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods">
                <h1 class="logo"></h1>
            </a>
            <a href="<%=basePath%>goods/homeGoods">
                <img src="<%=basePath%>img/home_header.png" style="margin-left: 20px;">
            </a>
            <a href="<%=basePath%>user/home">
                <div class="home"></div>
            </a>
        </div>
        <!--

            描述：左侧个人中心栏
        -->
        <%@include file="/WEB-INF/pages/common/user_nav.jsp" %>
        <!--

            描述：右侧内容区域
        -->
        <div id="user_content">
            <div class="share">
                <!--

                    描述：闲置商品展示
                -->
                <h1 style="text-align: center">我的闲置</h1>
                <hr/>
                <div class="share_content">
                    <c:if test="${empty goodsAndImage}">
                        <div class="no_share">
                            <span>没有任何内容，去逛逛其它的吧！</span>
                        </div>
                    </c:if>
                    <c:if test="${!empty goodsAndImage}">
                        <c:forEach var="items" items="${goodsAndImage}">
                            <div class="story">
                                <a href="<%=basePath%>goods/goodsId/${items.goods.id}" class="head_img">
                                    <img src="../upload/${items.images[0].imgUrl}">
                                </a>
                                <span class="name">${items.goods.name}</span>
                                <span class="text"
                                      style="overflow: hidden; outline: none;">${items.goods.describle}</span>
                                <div class="box">
                                    <div class="box_content">
                                        <div class="left_shadow"></div>
                                        <div class="left" index="1" style="display: none;"><</div>
                                        <div class="right_shadow"></div>
                                        <div class="left" index="3" style="display: none;">></div>
                                        <img src="../upload/${items.images[0].imgUrl}" index="2">
                                        <span class="com" style="display: none;left: 396.733px;"></span>
                                    </div>
                                    <div class="interact">
                                        <span class="fa fa-edit fa-lg"><a
                                                href="<%=basePath%>goods_editGoods?id=${items.goods.id}">编辑</a></span>
                                        <c:if test="${items.goods.status ==1}">
                                        <span class="fa fa-share fa-lg"><a
                                                href="<%=basePath%>goods_updateGoodsTime?id=${items.goods.id}&status=${items.goods.status}">擦亮</a></span>
                                        </c:if>
                                            <%--  <span class="fa fa-commenting"><a>${items.comments.commetNum}</a></span> --%>
                                        <c:if test="${items.goods.status ==1}">
                                            <span class="time">${items.goods.startTime}</span>
                                            <span class="fa fa-trash fa-lg"><a
                                                    href="<%=basePath%>goods_myGoodsInfo?id=${items.goods.id}&status=${items.goods.status}">下架</a></span>
                                        </c:if>
                                        <c:if test="${items.goods.status ==0}">
                                            <span class="fa fa-trash fa-lg"><a
                                                    href="<%=basePath%>goods_myGoodsInfo?id=${items.goods.id}&status=${items.goods.status}">上架</a></span>
                                        </c:if>
                                    </div>
                                    <br>
                                    <div class="like_detail">
                                        <div class="like_content">
                                            <span>状态：${items.goods.status == 1 ? '正在销售':'已下架'}</span>
                                        </div>
                                        <div class="like_content">
                                            <c:if test="${items.goods.status == 1}">
                                                <span>最近更新时间：${items.goods.polishTime == null ? items.goods.startTime : items.goods.polishTime}</span>
                                            </c:if>
                                        </div>
                                        <div class="like_content">
                                            <c:if test="${items.goods.status == 0}">
                                                <span>下架时间：${items.goods.endTime}</span>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <!--

                描述：最右侧，可能认识的人
            -->
            <div class="recommend">
                <div class="title">
                    <span class="text">可能认识的人</span>
                    <span class="change">换一组</span>
                    <span class="underline"></span>
                </div>
                <ul>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo1.jpg">
                        </a>
                        <span>Brudce</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo2.jpg">
                        </a>
                        <span>Graham</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo3.jpg">
                        </a>
                        <span>hly</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo4.jpg">
                        </a>
                        <span>Danger-XFH</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo5.jpg">
                        </a>
                        <span>Keithw</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>