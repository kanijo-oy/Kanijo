prawn_document do |pdf|
  pdf.font 'Helvetica'

  pdf.font_size 25
  pdf.font 'Helvetica', style: :bold
  pdf.text 'Pisarasi'
  pdf.font_size 14
  pdf.font 'Helvetica', style: :normal
  pdf.text 'This is export of things'

  pdf.text 'Report generated for ' + current_user.name
  pdf.text 'Home municipality ' + current_user.home_municipality

  pdf.move_down 10
  pdf.font_size 12

  curdate = nil
  @log_entries.sort_by {|e| [e.day, e.time]}.each do |e|
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
  end
end
