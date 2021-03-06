<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>CADET | Test : <c:out value="${testName}"></c:out></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="icon" type="image/ico" href="../../img/favicon.ico">
<link rel="stylesheet" href="../../css/datepicker.css">

<style>
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

footer {
	background: none scroll repeat 0 0 #FFFFFF;
}
</style>
<link rel="stylesheet" href="../../css/bootstrap-responsive.css">
<link rel="stylesheet" href="../../css/timepicker.css">
<link rel="stylesheet" href="../../css/main.css">

<script src="../../js/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->

	<jsp:include page="/admin/NavBar.jsp"/>
	<!--/.navbar -->

	<div class="container-fluid">

		<div class="row">
			<jsp:include page="/admin/Accordian.jsp"/>
			<!--/#accordion -->

			<div class="container-fluid span9">
				<div class="navbar">
					<div class="navbar-inner">
						<div class="container-fluid">
							<a class="brand" href="#editTest">Test : <c:out value="${testName}"></c:out>&nbsp;<span class="text-info"><small><em><c:out value="(${testType})"></c:out></em></small></span></a>
							<div style="margin:1.1%;" class="pull-right">
								<strong>Total Duration :&nbsp;&nbsp;</strong><span class="badge badge-info">&nbsp;&nbsp;<c:out value="${testDuration}"></c:out>&nbsp;&nbsp;</span>&nbsp;&nbsp;Min.
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid span8">
					<div class="container-fluid">
						<button id="btnAddCat" id="btnAddCat" class="btn btn-primary pull-left" data-toggle="modal">Add Category</button>
						<button id="btnDelCat" class="btn btn-danger offset1">Remove Category</button>
						<button id="btnTestSettings" class="btn btn-primary offset1">Test Settings</button>
					</div>
					<hr>
					<form id="frmSaveTest" class="container-fluid form-horizontal" method="post" action="TestManagement">
						<table class="table table-striped table-condensed table-hover">
							<c:set var="TestAdaptive" value="Adaptive"></c:set>
							<c:set var="TestNonAdaptive" value="Non-Adaptive"></c:set>
							<thead>
								<tr>
									<th></th>
									<th class="span4">Category</th>
									<th class="span6">
										<c:choose>
											<c:when test="${testType eq TestAdaptive}">Number of Questions</c:when>
											<c:otherwise>Questions</c:otherwise>
										</c:choose>
									</th>
									<th class="span6">Duration</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty categoryDetails}">
										<c:forEach var="i" items="${categoryDetails}">
											<tr>
												<td><input type="checkbox" id="chkDelCatList" name="chkDelCatList" value='<c:out value="chk${i.categoryId}"></c:out>'></td>
												<td class="span4">
													<c:out value="${i.categoryName}"></c:out>
												</td>
												<td class="span6">
													<c:choose>
														<c:when test="${testType eq TestAdaptive}">
															<input id='<c:out value="txtNoQueCat${i.categoryId}"></c:out>' name='<c:out value="txtNoQueCat${i.categoryId}"></c:out>' type="number" required placeholder="Questions per Category" min=1 value='<c:out value="${i.questionsPerCategory}"></c:out>'>
														</c:when>
														<c:otherwise>
																<input type="hidden" value="<c:out value="${i.categoryId}"></c:out>">
																<button class="btn btnViewQstn" title="View Questions">View</button>
																<button class="btn btnNewQstn" title="Add New Question">New</button>
																<button class="btn btnAddQstn" title="Add Questions from Question Bank">Add</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="span6">
													<div class="input-append">
														<input id='<c:out value="txtTimeCat${i.categoryId}"></c:out>' name='<c:out value="txtTimeCat${i.categoryId}"></c:out>' class="txtTimeCat" type="number" required placeholder="In Minutes" min=1 value='<c:out value="${i.timePerCategory}"></c:out>'>
														<span class="add-on">Min.</span>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td></td>
											<td><p class="text-warning">No Category Available</p></td>
											<td></td>
											<td></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div class="control-group pull-right">
							<div class="controls">
								<input type="hidden" id="requestType" name="requestType" value="saveTest">
								<input type="hidden" id="testId" name="testId" value="<c:out value="${testId}"></c:out>">
								<input type="hidden" id="testName" name="testName" value="<c:out value="${testName}"></c:out>">
								<input type="hidden" id="testType" name="testType" value="<c:out value="${testType}"></c:out>">
								<input type="hidden" id="testDuration" name="testDuration" value="<c:out value="${testDuration}"></c:out>">
								<input type="submit" class="btn btn-success" value="Save">
								<a href="testManagementHome.jsp" class="btn btn-danger">Cancel</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--/.row div -->
	</div>
	<!--/.container div -->

	<jsp:include page="/admin/Footer.jsp"/>

	<div id="divViewTestCatQstn" class="container-fluid modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h4 id="lblViewTestQstn"></h4>
		</div>
		<div class="modal-body container-fluid accordion" id="viewQstnAccordion">
			<div class="accordion-group"></div>
		</div>
 		<div class="modal-footer">
			<button class="btn btn-primary" data-dismiss="modal">Ok</button>
		</div>
	</div>

	<div id="divAddTestCatQstn" class="container-fluid modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h4 id="lblAddTestQstn"></h4>
		</div>
		<div class="modal-body container-fluid accordion" id="addQstnAccordion">
			<div class="accordion-group"></div>
		</div>
 		<div class="modal-footer">
			<button id="btnAddTestCatQstn" class="btn btn-primary">Add</button>
			<button class="btn" data-dismiss="modal">Cancel</button>
		</div>
	</div>


	<div id="divNewTestCatQstn" class="container-fluid modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h4 id="lblNewTestQstn"></h4>
		</div>
		<div class="modal-body container-fluid">
			<form id="frmNewTestCatQstn" class="container-fluid form-horizontal">
				<div class="control-group">
					<label class="control-label" for="taQstn">Question : </label>
					<div class="controls">
						<textarea id="taQstn" name="taQstn" class="span3 nic_edit" style="resize: none;" rows="5" placeholder="Question Body" required></textarea>
					</div>
				</div>
				<div class="control-group" style=""><label class="control-label">Options : </label></div>
				<div class="control-group">
					<div class="controls">
						A. <input type="radio" id="rbOptionA" name="rbOptions" value="A" required>
						<input type="text" id="txtOptA" required>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						B. <input type="radio" id="rbOptionB" name="rbOptions" value="B" required>
						<input type="text" id="txtOptB" required>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						C. <input type="radio" id="rbOptionC" name="rbOptions" value="C" required>
						<input type="text" id="txtOptC" required>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						D. <input type="radio" id="rbOptionD" name="rbOptions" value="D" required>
						<input type="text" id="txtOptD" required>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="optLevel">Level : </label>
					<div class="controls">
						<select id="optLevel" name="optLevel">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">Save</button>
						<button class="btn" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div id="divAddCat" class="modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h4>Add Category</h4>
		</div>
		<div class="modal-body">
			<form class="container=fluid form-horizontal">
				<div class="control-group">
					<label class="control-label" for="optCatList">Select Category : </label>
					<div class="controls">
						<select id="optCatList" name="optCatList">
						</select>
					</div>
				</div>
			</form>
		</div>
 		<div class="modal-footer">
			<button id="btnAddCatConfirm" class="btn btn-primary">Add</button>
			<button class="btn" data-dismiss="modal">Cancel</button>
		</div>
	</div>

	<div id="divNewCat" class="modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h3>New Category</h3>
		</div>
		<div class="modal-body">
			<form id="frmNewCat" class="container=fluid form-horizontal">
				<div class="control-group">
					<label class="control-label" for="optCatList">Category Name : </label>
					<div class="controls">
						<input type="text" id="txtCategoryName" name="txtCategoryName" placeholder="Category Name" required minlength=2>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" id="btnNewCatConfirm" class="btn btn-primary" value="Add">
						<a class="btn" data-dismiss="modal">Cancel</a>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div id="divTestSettings" class="modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h3>Test Settings</h3>
		</div>
		<div class="modal-body">
			<div class="container-fluid tabbable" style="margin-bottom: 18px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1" data-toggle="tab">Time Settings</a></li>
					<li><a href="#tab2" data-toggle="tab">Marking System</a></li>
					<li><a href="#tab3" data-toggle="tab">Accessibility</a></li>
              	</ul>
				<div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
					<div class="container-fluid tab-pane active" id="tab1">
						<form id="frmDateTime" class="form-horizontal container-fluid">
							<div class="control-group">
								<label class="control-label" for="txtDP">Date : </label>
								<div class="controls">
									<div class="input-append date" id="txtDP" data-date="" data-date-format="dd-mm-yyyy">
										<input id="txtTestDate" name="txtTestDate" class="span2" size="16" type="text" required readonly>
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="txtTPStart">Start Time : </label>
								<div class="controls">
									<div class="input-append bootstrap-timepicker-component">
										<input id="txtTPStart" name="txtTPStart" class="input-small" type="text" required readonly>
										<span class="add-on"><i class="icon-time"></i></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="txtTPEnd">End Time : </label>
								<div class="controls">
									<div class="input-append bootstrap-timepicker-component">
										<input id="txtTPEnd" name="txtTPEnd" class="input-small" type="text" required readonly>
										<span class="add-on"><i class="icon-time"></i></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<button class="btn btn-success" id="btnSaveTimeSettings">Save</button>
									<a class="btn" data-dismiss="modal">Cancel</a>
								</div>
							</div>
						</form>
					</div>

					<div class="container-fluid tab-pane" id="tab2">
						<c:set var="TestAdaptive" value="Adaptive"></c:set>
						<c:set var="TestNonAdaptive" value="Non-Adaptive"></c:set>
						<c:choose>
							<c:when test="${testType eq TestAdaptive}">
								<form id="frmInitDiff" class="container-fluid form-horizontal">
									<div class="control-group">
										<label class="control-label" for="optInitDifficulty">Initial Difficulty</label>
										<div class="controls">
											<select id="optInitDifficulty" name="optInitDifficulty">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
												<option>9</option>
												<option>10</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<button class="btn btn-success" id="btnSaveInitDiff">Save</button>
											<a class="btn" data-dismiss="modal">Cancel</a>
										</div>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<div id="divMarkSysCarousel" class="carousel slide">
									<div class="carousal-inner">
										<div class="active item">
											<form id="frmNegMark" class="container-fluid form-horizontal" style="margin:0;">
												<legend>Negative Marking</legend>
												<div class="control-group">
													<label class="control-label" for="optNegMarkFlag">Allowed : </label>
													<div class="controls">
														<select id="optNegMarkFlag">
															<option>Yes</option>
															<option>No</option>
														</select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="optDecreaseMark">Decrease Marks By : </label>
													<div class="controls">
														<select id="optDecreaseMark">
															<option>10 %</option>
															<option>20 %</option>
															<option>30 %</option>
															<option>40 %</option>
															<option>50 %</option>
															<option>60 %</option>
															<option>70 %</option>
															<option>80 %</option>
															<option>90 %</option>
															<option>100 %</option>
														</select>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<button class="btn btn-success" id="btnSaveNegMark">Save</button>
														<a class="btn" data-dismiss="modal">Cancel</a>
													</div>
												</div>
											</form>
										</div>

										<div class="item">
											<form id="frmLevelMark" class="container-fluid form-horizontal"  style="margin:0;">
												<legend>Assign Marks</legend>

												<div class="row">
													<label style="display:inline; margin-left:10%" for="txtLavel1">Level 1 : &nbsp;</label>
													<input id="txtLevel1" name="txtLevel1" type="number" class="input-mini levelMark" required min=1>
													<label style="display:inline; margin-left:10%;" for="txtLavel2">Level 6 : &nbsp;</label>
													<input id="txtLevel6" name="txtLevel6" type="number" class="input-mini levelMark" required min=1>
												</div>

 												<div class="row">
													<label style="display:inline; margin-left:10%" for="txtLavel2">Level 2 : &nbsp;</label>
													<input id="txtLevel2" name="txtLevel2" type="number" class="input-mini levelMark" required min=1>
													<label style="display:inline; margin-left:10%;" for="txtLevel7">Level 7 : &nbsp;</label>
													<input id="txtLevel7" name="txtLevel7" type="number" class="input-mini levelMark" required min=1>
												</div>
												<div class="row">
													<label style="display:inline; margin-left:10%" for="txtLavel3">Level 3 : &nbsp;</label>
													<input id="txtLevel3" name="txtLevel3" type="number" class="input-mini levelMark" required min=1>
													<label style="display:inline; margin-left:10%;" for="txtLevel8">Level 8 : &nbsp;</label>
													<input id="txtLevel8" name="txtLevel8" type="number" class="input-mini levelMark" required min=1>
												</div>
												<div class="row">
													<label style="display:inline; margin-left:10%" for="txtLavel4">Level 4 : &nbsp;</label>
													<input id="txtLevel4" name="txtLevel4" type="number" class="input-mini levelMark" required min=1>
													<label style="display:inline; margin-left:10%;" for="txtLevel9">Level 9 : &nbsp;</label>
													<input id="txtLevel9" name="txtLevel9" type="number" class="input-mini levelMark" required min=1>
												</div>
												<div class="row">
													<label style="display:inline; margin-left:10%" for="txtLavel5">Level 5 : &nbsp;</label>
													<input id="txtLevel5" name="txtLevel5" type="number" class="input-mini levelMark" required min=1>
													<label style="display:inline; margin-left:10%;" for="txtLevel10">Level 10 : </label>
													<input id="txtLevel10" name="txtLevel10" type="number" class="input-mini levelMark" required min=1>
												</div>

 												<div class="row span2" style="margin-top:5%; margin-left:20%">
													<input type="submit" class="btn btn-success pull-left" id="btnSaveLevelMark" value="Save">
													<a class="btn pull-right" data-dismiss="modal">Cancel</a>
												</div>
											</form>
										</div>
									</div>
									<a style="left:-4%" class="carousel-control left" href="#divMarkSysCarousel" data-slide="prev">&lsaquo;</a>
									<a style="right:-4%" class="carousel-control right" href="#divMarkSysCarousel" data-slide="next">&rsaquo;</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="tab-pane" id="tab3">
						<button id="btnAddUserCat" class="btn btn-primary">Add User Category</button>
						<table id="tblTestCandCat" style="margin-top:3%" id="tblUserCat" class="table table-striped table-condensed table-hover">
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
            </div>

		</div>
	</div>


	<div id="divAddCandCat" class="modal hide fade" tabindex="-1">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h4>User Category</h4>
		</div>
		<div class="modal-body">
			<form class="container=fluid form-horizontal">
				<div class="control-group">
					<label class="control-label" for="optCandCatList">Select User Category : </label>
					<div class="controls">
						<select id="optCandCatList" name="optCandCatList"></select>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button id="btnAddCandCat" class="btn btn-primary">Add</button>
			<button id="btnCancelAddCandCat" class="btn">Cancel</button>
		</div>
	</div>

	<script id="tmpltCandCat" type="text/x-handlebars-template">
		{{#if candCatList}}
			{{#each candCatList}}
				<tr>
					<td>{{candidateCategory}}</td>
					<td><button id="delete_{{candidateCategory}}" class="btn btn-danger btnDelete">Remove</button></td>
				</tr>
			{{/each}}
		{{else}}
			<tr>
				<td><p class="text-warning">No Candidate Category Added</p></td>
				<td></td>
			</tr>
		{{/if}}
	</script>

	<script id="tmpltCandCatList" type="text/x-handlebars-template">
		{{#if candCatList}}
			{{#each candCatList}}
				<option>{{candidateCategory}}</option>
			{{/each}}
		{{else}}
			<option><p class="text-warning">No Question Added</p></option>
		{{/if}}
	</script>

	<script id="tmpltCategories" type="text/x-handlebars-template">
		{{#if categoryList}}
			{{#each categoryList}}
				<option value="{{categoryId}}"> {{categoryName}} </option>
			{{/each}}
		{{/if}}
	</script>

	<script id="tmpltCategoryDetails" type="text/x-handlebars-template">
		{{#if category}}
			<tr>
				<td><input type="checkbox" id="chkDelCatList" name="chkDelCatList" value="chk{{category.categoryId}}"></td>
				<td class="span4">{{category.categoryName}}</td>
				<td class="span6">

					<c:choose>
						<c:when test="${testType eq TestAdaptive}">
							<input id="txtNoQueCat{{category.categoryId}}" name="txtNoQueCat{{category.categoryId}}" type="number" required placeholder="Questions per Category" min=1 value="{{category.questionPerCategory}}">
						</c:when>
						<c:otherwise>
							<input type="hidden" value="{{category.categoryId}}">
							<button class="btn btnViewQstn" title="View Questions">View</button>
							<button class="btn btnNewQstn" title="Add New Question">New</button>
							<button class="btn btnAddQstn" title="Add Questions from Question Bank">Add</button>
						</c:otherwise>
					</c:choose>
				</td>
				<td class="span6">
					<div class="input-append">
						<input id="txtTimeCat{{category.categoryId}}" name="txtTimeCat{{category.categoryId}}" type="number" required placeholder="In Minutes" class="txtTimeCat" min=1 value="{{category.timePerCategory}}">
						<span class="add-on">Min.</span>
					</div>
				</td>
			</tr>
		{{/if}}
	</script>

	<script id="tmpltViewTestCatQstn" type="text/x-handlebars-template">
		{{#if questionList}}
			{{#each questionList}}
				<div class="accordion-group">
					<div class="accordion-heading navbar" style="margin-bottom:0;">
						<div class="navbar-inner">
							<div class="container-fluid">
								<a class="accordion-toggle span3" data-toggle="collapse" data-parent="#viewQstnAccordion" href="#qstn{{questionId}}"><strong>{{#qstnHead}}{{{question}}}{{/qstnHead}}</strong></a>
								<button id="{{questionId}}" class="btn btn-danger btnRemoveQstnFromTest pull-right">Remove</button>
							</div>
						</div>
					</div>
					<div id="qstn{{questionId}}" class="accordion-body collapse">
						<div class="accordion-inner">
							<div container-fluid">
								{{{question}}}
							</div>
							<div class="row">
								<div class="container-fluid">
									<label><strong>Options : </strong></label>
									<ul class="nav">
										<li>A. {{optionA}}</li>
										<li>B. {{optionB}}</li>
										<li>C. {{optionC}}</li>
										<li>D. {{optionD}}</li>
									</ul>
								</div>
								<div class="container-fluid">
									<ul class="nav">
										<li><strong>Level :</strong> {{level}}</li>
										<li><strong>Correct Answer :</strong> {{correctAnswer}}</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			{{/each}}
		{{else}}
			<div><p class="text-warning">No Question Added</p></div>
		{{/if}}
	</script>

	<script id="tmpltAddTestCatQstn" type="text/x-handlebars-template">
		{{#if questionList}}
			{{#each questionList}}
				<div class="accordion-group">
					<div class="accordion-heading navbar" style="margin-bottom:0;">
						<div class="navbar-inner">
							<div class="container-fluid">
								<input class="pull-left" type="checkbox" name="chkAddQstn" id="chkAdd{{questionId}}" value="{{questionId}}">
								<a class="accordion-toggle span3" data-toggle="collapse" data-parent="#addQstnAccordion" href="#qstn{{questionId}}"><strong>{{#qstnHead}}{{{question}}}{{/qstnHead}}</strong></a>
							</div>
						</div>
					</div>
					<div id="qstn{{questionId}}" class="accordion-body collapse">
						<div class="accordion-inner">
							<div class="container-fluid">
								{{{question}}}
							</div>
							<div class="row">
								<div class="container-fluid">
									<label><strong>Options : </strong></label>
									<ul class="nav">
										<li>A. {{optionA}}</li>
										<li>B. {{optionB}}</li>
										<li>C. {{optionC}}</li>
										<li>D. {{optionD}}</li>
									</ul>
								</div>
								<div class="container-fluid">
									<ul class="nav">
										<li><strong>Level :</strong> {{level}}</li>
										<li><strong>Correct Answer :</strong> {{correctAnswer}}</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			{{/each}}
		{{else}}
			<div><p class="text-warning">No Question Available</p></div>
		{{/if}}
	</script>

	<script src="../../js/jquery-1.8.2.js"></script>
	<script src="../../js/jquery.json-2.3.js"></script>
	<script src="../../js/bootstrap.js"></script>
	<script src="../../js/bootstrap-datepicker.js"></script>
	<script src="../../js/bootstrap-timepicker.js"></script>
	<script src="../../js/bootbox.js"></script>
	<script src="../../js/handlebars.js"></script>
	<script src="../../js/jquery.validate.js"></script>
	<script src="../../js/additional-methods.js"></script>
	<script src="../../js/nicEdit.js"></script>
	<script src="../js/jsGlobal.js"></script>
	<script src="../js/jsTestPage.js"></script>

	<c:if test="${result eq true}">
		<script>
			var alertDiv = "<div style=\"position:absolute; margin-top:0.15%;\" class=\"alert alert-success offset4 span4\">You have saved the details <strong>successfully !!!</strong></div>";
			$(document).ready(function(e) {
				setTimeout(function() {
					$("body").prepend(alertDiv);
					setTimeout(function() { $(".alert").alert("close"); },3000);
				},600);
			});
		</script>
	</c:if>
		<script type="text/javascript">
        $("#test").addClass("active");
        $("#collapse3").addClass("in");
        </script>
</body>
</html>