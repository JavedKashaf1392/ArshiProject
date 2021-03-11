<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</head>
<body>

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h3>STUDENT REGISTER PAGE</h3>
            </div>
           
            <div class="card-body">
            
            <form id="myStudentForm" action="save" method="POST">
                   
                    <!-- Row #1 -->
                    <div class="row">
                        <div class="col-2">
                            <label for="stdId">Student Id</label>
                        </div>
                        <div class="col-4">
                            <input type="text" name="stdId" id="stdId" class="form-control" />
                        </div>
                        <div class="col-6">
                            <span id="stdIdError"></span>
                        </div>
                    </div>


                    <!-- Row #2 -->
                    <div class="row">
                        <div class="col-2">
                            <label for="stdName">Stdudent Name </label>
                        </div>
                        <div class="col-4">
                            <input type="text" name="stdName" id="stdName" class="form-control" />
                        </div>
                        <div class="col-6">
                            <span id="stdNameError"></span>
                        </div>
                    </div>

                    <!-- Row #3 -->
                    <div class="row">
                        <div class="col-2">
                            <label>Student Course</label>
                        </div>
                        <div class="col-4">
                            <select name="stdCourse" id="stdCourse" class="form-control">
                                <option value="">-SELECT-</option>
                                <option value="SPRING">SPRING</option>
                                <option value="BOOT">BOOT</option>
                                <option value="PROJECT">PROJECT</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <span id="stdCourseError"></span>
                        </div>
                    </div>

                    <!-- Row #4 -->
                    <div class="row">
                        <div class="col-2">
                            <label>Student Gender</label>
                        </div>
                        <div class="col-4">
                            <input type="radio" name="stdGen" id="stdGen1" value="Male" /> Male
                            <input type="radio" name="stdGen" id="stdGen2" value="Female" /> Female
                        </div>
                        <div class="col-6">
                            <span id="stdGenError"></span>
                        </div>
                    </div>

                    <!-- Row #5 -->
                    <div class="row">
                        <div class="col-2">
                            <label>Student Language</label>
                        </div>
                        <div class="col-4">
                            <input type="checkbox" name="stdLang" id="stdLang1" value="ENG"/> ENG
                            <input type="checkbox" name="stdLang" id="stdLang2" value="HIN"/> HIN
                            <input type="checkbox" name="stdLang" id="stdLang3" value="TEL"/> TEL
                        </div>
                        <div class="col-6">
                            <span id="stdLangError"></span>
                        </div>
                    </div>

                    <input type="submit" value="Register" class="btn btn-success" />
                </form>
            </div>
            <div class="card-footer"></div>

        </div><!-- card end -->

    </div>
    <!-- container end -->

    <script>
        $(document).ready(function () {
            $("#stdIdError").hide();
            $("#stdNameError").hide();
            $("#stdCourseError").hide();
            $("#stdGenError").hide();
            $("#stdLangError").hide();
            

            var stdIdError = false;
            var stdNameError = false;
            var stdCourseError = false;
            var stdGenError = false;
            var stdLangError = false;

            $("#stdId").keyup(function () {
                validate_stdId();
            });
            $("#stdName").keyup(function () {
                //convert lower to upper case
                $("#stdName").val($("#stdName").val().toUpperCase());
                validate_stdName();
            });

            $("#stdCourse").change(function () {
                validate_stdCourse();
            });

            $('input[type="radio"][name="stdGen"]').change(function () {
                validate_stdGen();
            });
            $('input[type="checkbox"][name="stdLang"]').change(function(){
                validate_stdLang();
            });

            function validate_stdId() {
                var val = $("#stdId").val();
                //only digits starts with 1-9 later any digit is OK
                var exp = /^[1-9][0-9]*$/;
                if (val == '') {
                    $("#stdIdError").html("Enter <b>Student Id</b>");
                    $("#stdIdError").css("color", "red");
                    $("#stdIdError").show();
                    stdIdError = false;
                } else if (!exp.test(val)) {
                    //value not matched with expression
                    $("#stdIdError").html("Enter <b>Valid Id</b>");
                    $("#stdIdError").css("color", "red");
                    $("#stdIdError").show();
                    stdIdError = false;
                } else {
                    $("#stdIdError").hide();
                    stdIdError = true;
                }
                return stdIdError;
            }
            //--------------
            function validate_stdName() {
                var val = $("#stdName").val();
                //only upper/lower case chars atleast 3 char and at max 8 chars
                var exp = /^[A-Z]{3,8}$/;

                if (val == '') {
                    $("#stdNameError").html("Enter <b>Student Name</b>");
                    $("#stdNameError").css("color", "red");
                    $("#stdNameError").show();
                    stdNameError = false;
                } else if (!exp.test(val)) {
                    $("#stdNameError").html("Enter <b>Valid Name</b>");
                    $("#stdNameError").css("color", "red");
                    $("#stdNameError").show();
                    stdNameError = false;
                } else {
                    $("#stdNameError").hide();
                    stdNameError = true;
                }
                return stdNameError;
            }

            //---------------------//
            function validate_stdCourse() {
                var val = $("#stdCourse").val();
                if (val == '') {
                    $("#stdCourseError").html("Select <b>Student Course</b>");
                    $("#stdCourseError").css("color", "red");
                    $("#stdCourseError").show();
                    stdCourseError = false;
                } else {
                    $("#stdCourseError").hide();
                    stdCourseError = true;
                }
            }
            //----------------//
            function validate_stdGen() {
                var len = $('input[type="radio"][name="stdGen"]:checked').length;
                if (len == 0) {
                    $("#stdGenError").html("Choose <b>One Gender</b>");
                    $("#stdGenError").css("color", "red");
                    $("#stdGenError").show();
                    stdGenError = false;
                } else {
                    $("#stdGenError").hide();
                    stdGenError = true;
                }
                return stdGenError;
            }
            //--------------//
            function validate_stdLang(){
                var len = $('input[type="checkbox"][name="stdLang"]:checked').length;
                if(len==0){
                    $("#stdLangError").html("Select <b>Any One Language</b>");
                    $("#stdLangError").css("color","red");
                    $("#stdLangError").show();
                    stdLangError = false;
                }else{
                    $("#stdLangError").hide();
                    stdLangError = true;
                }
                return stdLangError;
            }

            //---------ON SUBMIT--------------//
            $("#myStudentForm").submit(function () {
                validate_stdId();
                validate_stdName();
                validate_stdCourse();
                validate_stdGen();
                validate_stdLang();
                if (stdIdError && stdNameError
                    && stdCourseError && stdGenError
                    && stdLangError)
                    return true;
                else
                    return false;
            });

        });
    </script>
</body>

</html>