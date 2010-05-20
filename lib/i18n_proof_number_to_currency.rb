# i18nProofNumberToCurrency by Ireneusz Skrobis 2010
module ApplicationHelper

  def number_to_euro(number)
    i18n_proof_number_to_currency(number, 2, "€", ".", "", "%n%u")
  end

  def number_to_us_dollar(number)
    i18n_proof_number_to_currency(number, 2, "$", ".", "", "%u%n")
  end

  def number_to_pound(number)
    i18n_proof_number_to_currency(number, 2, "&pound;", ".", "", "%u%n")
  end

  def number_to_yen(number)
    i18n_proof_number_to_currency(number, 2, "¥", ".", "", "%u%n")
  end

  def i18n_proof_number_to_currency(number, precision, unit, separator, delimiter, format)
    begin
      rounded_number = (Float(number) * (10 ** precision)).round.to_f / 10 ** precision
      parts = ("%01.#{precision}f" % rounded_number).to_s.split('.')
      parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
      format.gsub(/%n/, parts.join(separator)).gsub(/%u/, unit)
    rescue
      number
    end
  end

end