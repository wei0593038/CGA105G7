// 新增 start
$('#Aloc_name').keyup(function (e) {
  let errorMsg = $('#loc-errorMsg')
  if (($(this).val()).trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setAllValid('locName', false);
  } else {
    errorMsg.text('✅');
    setAllValid('locName', true);
  }
});

$('#Alongitude').keyup(function (e) {
  let regExp = /^[0-9.]+$/;
  let val = $(this).val();
  let errorMsg = $('#long-errorMsg');
  if (val.trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setAllValid('longitude', false);
  } else if (!regExp.test(val)) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌格式錯誤');
    setAllValid('longitude', false);
  } else {
    errorMsg.text('✅');
    setAllValid('longitude', true);
  }
});

$('#Alatitude').keyup(function (e) {
  let regExp = /^[0-9.]+$/;
  let val = $(this).val();
  let errorMsg = $('#alati-errorMsg');
  if (val.trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setAllValid('latitude', false);
  } else if (!regExp.test(val)) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌格式錯誤');
    setAllValid('latitude', false);
  } else {
    errorMsg.text('✅');
    setAllValid('latitude', true);
  }
});

$('#Aaddress').keyup(function (e) {
  let errorMsg = $('#address-errorMsg')
  if (($(this).val()).trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setAllValid('address', false);
  } else {
    errorMsg.text('✅');
    setAllValid('address', true);
  }
});

$('#Aphone').keyup(function (e) {
  let regExp = /^-?[0-9]+$/;
  let val = $(this).val();
  let errorMsg = $('#phone-errorMsg');
  if (!regExp.test(val)) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌格式錯誤');
    setAllValid('Aphone', false);
  }else{
	errorMsg.text('✅');
	 setAllValid('Aphone', true);  
  }
});

let cdtMap = new Map();
function setAllValid(key, value) {
  cdtMap.set(key, value);

  if (cdtMap.size === 4) {
    let num = 0;
    for (let value of cdtMap.values()) {
      if (value === true) {
        num++;
      }
    }
    if (num === 4) {
      $("#send").prop("disabled", false);
    } else {
      $("#send").prop("disabled", true);
    }
  }
}

// 新增 end


// 修改start
$('#Uloc_name').keyup(function (e) {
  let errorMsg = $('#Uloc-error')
  if (($(this).val()).trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setUpdateVal('locName', false);
  } else {
    errorMsg.text('✅');
    setUpdateVal('locName', true);
  }
});

$('#Ulongitude').keyup(function (e) {
  let regExp = /^[0-9.]+$/;
  let val = $(this).val();
  let errorMsg = $('#Ulong-error');
  if (val.trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setUpdateVal('longitude', false);
  } else if (!regExp.test(val)) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌格式錯誤');
    setUpdateVal('longitude', false);
  } else {
    errorMsg.text('✅');
    setUpdateVal('longitude', true);
  }
});

$('#Ulatitude').keyup(function (e) {
  let regExp = /^[0-9.]+$/;
  let val = $(this).val();
  let errorMsg = $('#Ulati-error');
  if (val.trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setUpdateVal('latitude', false);
  } else if (!regExp.test(val)) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌格式錯誤');
    setUpdateVal('latitude', false);
  } else {
    errorMsg.text('✅');
    setUpdateVal('latitude', true);
  }
});

$('#Uaddress').keyup(function (e) {
  let errorMsg = $('#Uaddress-error')
  if (($(this).val()).trim().length === 0) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌請勿空白');
    setUpdateVal('address', false);
  } else {
    errorMsg.text('✅');
    setUpdateVal('address', true);
  }
});

$('#Uphone').keyup(function (e) {
  let regExp = /^-?[0-9]+$/;
  let val = $(this).val();
  let errorMsg = $('#Uphone-error');
  if (!regExp.test(val)) {
    errorMsg.css('color', 'red');
    errorMsg.text('❌格式錯誤');
    setUpdateVal('Uphone', false);
  } else {
    errorMsg.text('✅');
    setUpdateVal('Uphone', true);
  }
});

let updateCdt = new Map();
function setUpdateVal(key, value) {
  cdtMap.set(key, value);

  if (cdtMap.size === 4) {
    let num = 0;
    for (let value of cdtMap.values()) {
      if (value === true) {
        num++;
      }
    }
    if (num === 4) {
      $("#updateSend").prop("disabled", false);
    } else {
      $("#updateSend").prop("disabled", true);
    }
  }
}

// 修改end


