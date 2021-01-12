from single_calendar import *
from datetime import timedelta
from plotting import plot_multi_cal_time
from helpers import get_prod_by_date


class MultiCalendar:

    def __init__(self, start_date=None, end_date=None, calendars=None, print_details=False, add_gridlines=True):
        self.start_date = start_date
        self.end_date = end_date
        self.calendars = [Calendar(cal, self.start_date, self.end_date) for cal in calendars]
        nonempty_calendars = [len(c.components_total) > 0 for c in self.calendars]
        if True not in nonempty_calendars:
            no_cal_data_error = 'No calendar data found between {} and {}. Please make sure to export an up-to-date ' \
                                'version of your calendars to your timetrack/data/calendars/ folder.' \
                .format(self.start_date, self.end_date)
            raise ValueError(no_cal_data_error)
        self.productivity_dict = self.get_productivity_dict()
        self.print_details = print_details
        self.gridlines = add_gridlines

    def get_productivity_dict(self):
        # aggregate component productivity scores from all calendars by date
        all_comps = []
        for cal in self.calendars:
            all_comps += cal.components_total
        return get_prod_by_date(all_comps)

    def get_time_summary(self, printing=True):
        # get data
        timepoint_str = get_timerange_str(self.start_date, self.end_date)
        times = []
        prod_scores = []
        names = []
        total_time = timedelta(0)
        for cal in self.calendars:
            time_spent, productivity = cal.get_time_summary(False)
            times.append(time_spent)
            prod_scores.append(productivity)
            names.append(cal.name)
            total_time += time_spent

        if printing:
            time_list = convert_dt(total_time)
            print('==>spent {} days {} hours {} minutes on tasks {}'.format(time_list[0], time_list[1], time_list[2],
                                                                            timepoint_str))
            for cal_name, timing, prod in zip(names, times, prod_scores):
                time_list = convert_dt(timing)
                if prod is None:
                    prod_str = 'N/A'
                else:
                    prod_str = round(prod, 1)
                print(
                    '   - {} tasks: {} days {} hours {} minutes (avg. productivity: {})'.format(cal_name, time_list[0],
                                                                                                time_list[1],
                                                                                                time_list[2], prod_str))
            print('')
        return times, names, prod_scores

    def plot_time_summary(self, save_name):
        names = [cal.name for cal in self.calendars]
        time_delta_dicts = [cal.time_delta_dict for cal in self.calendars]
        plot_multi_cal_time(names, time_delta_dicts, self.productivity_dict, save_name,
                            print_details=self.print_details, add_gridlines=self.gridlines)

