class Patients::CliniciansController < PatientLoggedinController


  def show
    @clinician = @patient.clinician
    @plwk = @patient.patient_logs.last(7)

    @hash = Gmaps4rails.build_markers(@clinician) do |clinician, marker|
      marker.lat clinician.latitude
      marker.lng clinician.longitude
    end

    render layout: 'patient-dash'
  end

end
