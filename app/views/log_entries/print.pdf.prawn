prawn_document do |pdf|
  pdf.font 'Helvetica'

  pdf.font_size 25
  pdf.font 'Helvetica', style: :bold
  pdf.text 'Pisarasi'
  pdf.font_size 12
  pdf.font 'Helvetica', style: :normal
  #pdf.text 'This is export of things'

  pdf.text 'Name: ' + current_user.name if current_user.name
  pdf.text 'Phone: ' + current_user.phonenumber if current_user.phonenumber
  pdf.text 'Email: ' + current_user.email
  pdf.text 'Hometown: ' + current_user.home_municipality if current_user.home_municipality

  pdf.move_down 10
  pdf.font_size 9

  curdate = nil
  tbl = []
  tbl << ['Date', 'Time of entry', 'Duration', 'Place name', 'Place address', '# of people', 'Names of people']
  @log_entries.sort_by {|e| [e.day, e.time]}.each do |e|
=begin
    if e.day != curdate
      curdate = e.day
      pdf.move_down 10
      pdf.font_size(16) do
        pdf.font('Helvetica', style: :bold) do
          pdf.text l(e.day, format: "%A %d.%m.")
        end
      end
    end
    entry = ""
    entry += e.time + " " if e.time
    entry += e.description
    entry += ' (' + e.contacts + ' people present)' if e.contacts
    pdf.text entry
=end
    tbl << [e.day.strftime('%Y-%m-%d'), e.time, e.durationtext, e.description, e.address, e.contacts, e.persons]

  end
  pdf.table tbl
end
