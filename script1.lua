function ahrs_good()
	if not ahrs:healthy-) then return do_transition, 2000 end
	gcs:send_text(6, "hello world!")
	return ahrs_good, 2000
end

function ahrs_bad()
	if ahrs:healthy() then return do_transition, 2000 end
	gcs:send_text(6, "A little lol")
	return ahrs_bad, 1000
end

function do_transition()
	if ahrs:healthy() then
		return ahrs_good, 2000
	end
	return ahrs_bad, 1000
end

return do_transition()