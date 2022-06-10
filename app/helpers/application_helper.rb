module ApplicationHelper
  # Wrapper around form_with that automatically populates some data attributes:
  #   - data-lob-mangle
  #   - data-lob-values
  #   - data-lob-errors
  #
  # Example usage:
  #   lob_form_with(
  #     model: model,
  #     data: { lob: 'abc123' },
  #     html: { style: 'min-height:400px' }
  #   ) {} %>
  #
  def lob_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
    scope_for_mangle = scope

    if model
      model = model.is_a?(Array) ? model.last : model
      scope_for_mangle ||= model_name_from_record_or_class(model).param_key
    end

    # Add default options
    options = options.dup
    options[:data] = (options[:data] || {}).with_indifferent_access.tap do |data|
      data[:'lob-mangle'] ||= "#{scope_for_mangle}[$name]"
      if model
        data[:'lob-values'] ||= model.as_json
        data[:'lob-errors'] = model.errors.map { { name: _1.attribute, message: _1.full_message } }
      end
    end

    form_with(model: model, scope: scope, url: url, format: format, **options, &block)
  end
end
