from helpers import read_calendar, get_total_time, convert_dt, get_avg_productivity, get_timerange_str, get_time_by_date
import warnings


class Calendar:

    def __init__(self, file_path, start_date=None, end_date=None):
        self.start_date = start_date
        self.end_date = end_date
        self.components_total = read_calendar(file_path, self.start_date, self.end_date)
        self.name = file_path.split('/')[-1]
        self.time_delta_dict = get_time_by_date(self.components_total)
        if len(self.components_total) == 0:
            no_cal_data_warning = 'No tasks found in {} calendar for period between {} and {}. Did you remember to ' \
                                  'export an up-to-date version of {} to timetrack/data/calendars/?'\
                .format(self.name, self.start_date, self.end_date, self.name)
            warnings.warn(no_cal_data_warning)

    def print_components(self):
        components = self.components_total
        print('Tasks:')
        print('')
        for component in components:
            if component.name == "VEVENT":
                # productivity on scale of 1 (unproductive) - 5 (highly productive)
                print('{} (productivity: {})'.format(component.get('summary'), component.get('location')))
                total = component.get('dtend').dt - component.get('dtstart').dt
                print('{0:%Y-%m-%d %H:%M} - {1:%H:%M} (total: {2:})'.format(component.get('dtstart').dt,
                                                                            component.get('dtend').dt, total))
                print('')

    def get_time_summary(self, printing=True):
        timerange_str = get_timerange_str(self.start_date, self.end_date)
        components = self.components_total
        avg_productivity = get_avg_productivity(components)
        spent_time = get_total_time(components)
        if printing:
            time_list = convert_dt(spent_time)
            print('==>spent {} days {} hours {} minutes on {} tasks {}'.format(time_list[0], time_list[1], time_list[2],
                                                                               self.name, timerange_str))
            print('   avg productivity score: {}'.format(avg_productivity))
            print('')
        return spent_time, avg_productivity
