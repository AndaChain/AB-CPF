// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// test
let id_e = "e9"
var first = "first"
var last = "last"
var ot_plan = "111"
var time_plan = "14:00:00 - 15:00:00"
console.log(  "  <tr id="+id_e+">  \n      <td> <a id=\'"+id_e+"btn\' class=\"btn otbtn\" rel=\"nofollow\" data-method=\"delete\" href=\"/manage/d1?id_e="+id_e+"\">-<\/a> <\/td>\n      \n      \n      <td> <div class=\'square green\' ><\/div> <\/td>\n      <td> "+id_e+" <\/td>\n      <td> "+first+" <\/td>\n      <td> "+last+" <\/td>\n      <td id="+id_e+"st> "+time_plan+" <\/td>\n      <td> <\/td>\n      <td> "+ot_plan+" <\/td>\n      <td> <\/td>\n      <td> <input type=\"checkbox\" name=\"ot\" id=\"ot\" value=\""+id_e+"\" class=\"selectable\" /> <\/td>\n  <\/tr>\n\n    <script>\n      \$(document).ready(function(){\n        var id_em = \'"+id_e+"\'\n        \$(\"#\"+id_em+\"btn\").click(function(){\n          \$(\"#\"+id_em).remove();\n        });\n      });\n    <\/script>\n\n"  )
