/* global $ */

$(function () {
	$('#customer_postal_code').jpostal({
		postcode : [
			'#customer_postal_code'
		],
		address : {
			'#customer_prefecture_code' : '%3',
			'#customer_city' : '%4%5',
			'#customer_block' : '%6%7'
		}
	});
});