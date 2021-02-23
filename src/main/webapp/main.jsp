<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .wrap {
        display: flex;
        flex-direction: column;
        width: 1000px;
        height: 80%;
        margin-top: auto;
        margin-bottom: auto;
    }

    .row {
        width: 100%;
        flex-basis: 50%;
        display: flex;
    }

    .section {
        display: flex;
        flex-direction: column;
        padding: 10px;
        margin-bottom: 10px;
        background-color: #FFFFFF;
        border-radius: 10px;
    }

    .notice {
        width: 100%;
        flex-basis: 100%;
    }

    .sign {
        flex-basis: 30%;
        margin-right: 10px;
    }

    .board {
        flex-basis: 70%;
    }

    .sub-title {
        display: flex;
        font-weight: bold;
        font-size: 20px;
        padding-bottom: 5px;
    }

    .sub-title i {
        line-height: inherit;
        margin-right: 5px;
    }

    .into-page-btn {
        margin-left: auto;
        color: #FFFFFF;
        text-decoration: none;
        background-color: #39485D;
        font-size: 20px;
        width: 30px;
        height: 30px;
        line-height: 30px;
        border-radius: 5px;
        text-align: center;
    }

    .into-page-btn:hover {
        background-color: #00add0;
        transition-duration: 0.1s;
    }

    .section-content {
        height: 100%;
        padding: 2px 0;
        border-top: 2px solid #999696;
        border-bottom: 2px solid #999696;
    }

    .section-list {
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .list-item {
        width: 100%;
        flex-basis: 25%;
        line-height: 48px;
        text-align: center;
        border-bottom: 1px solid #d4d4d4;
    }

    .notice-list-item:last-child {
        border-bottom: none;
    }

    .sign-list-item:last-child {
        border-bottom: none;
    }

    .board-list-item:last-child {
        border-bottom: none;
    }

    .no-read-number {
        margin-left: 10px;
        display: inline-block;
        width: 30px;
        height: 30px;
        border-radius: 15px;
        text-align: center;
        line-height: 30px;
        color: #FCE5C1;
        background-color: #FC9C12;
    }

    table {
        border-collapse: collapse;
    }

    .notice-thead {
        width: 100%;
        height: 25%;
        display: flex;
    }

    .notice-tbody {
        width: 100%;
        height: 25%;
        display: flex;
        flex-direction: column;
    }

    .tr-parent {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    .notice-list-item {
        display: flex;
    }

    .notice .board-no {
        flex-basis: 10%
    }

    .notice .board-subject {
        flex-basis: 35%;
    }

    .notice .board-writer-name {
        flex-basis: 15%;
    }

    .notice .board-write-day {
        flex-basis: 20%;
    }

    .notice .board-hit {
        flex-basis: 20%;
    }

</style>
<body>
    <header class="header">
        <div class="category">Main</div>
        <div class="title">메인페이지</div>
    </header>

    <div class="wrap">
        <div class="row">
            <section class="notice section">
                <div class="sub-title">
                    <i class="fas fa-microphone"></i>
                    <span class="sub-title-text">사내공지</span>
                    <a href="" class="into-page-btn">+</a>
                </div>
                <div class="section-content">
                    <table class="section-list">
                        <thead class="notice-thead">
                            <tr class="list-item notice-list-item">
                                <th class="board-no">No.</th>
                                <th class="board-subject">제목</th>
                                <th class="board-writer-name">작성자</th>
                                <th class="board-write-day">작성일</th>
                                <th class="board-hit">조회수</th>
                            </tr>
                        </thead>
                        <tbody class="notice-tbody">
                            <c:forEach var="notice" items="${requestScope.noticeList}">
                                <tr class="list-item notice-list-item">
                                    <td class="board-no">공지</td>
                                    <td class="board-subject">${notice.subject}</td>
                                    <td class="board-writer-name">${notice.name} ${notice.position}</td>
                                    <td class="board-write-day">${notice.regdate}</td>
                                    <td class="board-hits">${notice.hit}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>

        <div class="row">
            <section class="sign section">
                <div class="sub-title">
                    <i class="fas fa-file-alt"></i>
                    <span class="sub-title-text">전자결재</span>
                    <a href="" class="into-page-btn">+</a>
                </div>
                <div class="section-content">
                    <ul class="section-list">
                        <li class="list-item sign-list-item">
                            <span>결재전체</span>
                            <span class="no-read-number">${noReadCount.total}</span>
                        </li>
                        <li class="list-item sign-list-item">
                            <span>결재완료</span>
                            <span class="no-read-number">${noReadCount.complete}</span>
                        </li>
                        <li class="list-item sign-list-item">
                            <span>결재거부</span>
                            <span class="no-read-number">${noReadCount.refuse}</span>
                        </li>
                        <li class="list-item sign-list-item">
                            <span>결재대기</span>
                            <span class="no-read-number">${noReadCount.wait}</span>
                        </li>
                    </ul>
                </div>
            </section>

            <section class="board section">
                <div class="sub-title">
                    <i class="fas fa-file-alt"></i>
                    <span class="sub-title-text">게시판</span>
                    <a href="" class="into-page-btn">+</a>
                </div>
                <div class="section-content">
                    <table class="section-list">
                        <tbody class="tr-parent">
                            <c:forEach var="normal" items="${requestScope.normalList}">
                            <tr class="list-item board-list-item">
                                <td class="board-subject">${normal.subject}</td>
                                <td class="board-writer-name">${normal.name} ${normal.position}</td>
                                <td class="board-write-day">${normal.regdate}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>
</body>
</html>