return function(config)
  local filename = {
    "filename",
    file_status = true, -- Displays file status (readonly status, modified status)
    path = 1,

    shorting_target = 100,
  }

  table.insert(config.sections.lualine_c, 1, filename)
  table.insert(config.inactive_sections.lualine_c, 1, filename)

  return config
end
