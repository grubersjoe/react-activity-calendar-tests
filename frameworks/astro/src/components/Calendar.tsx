import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';
import { calendarProps } from '../../../props.ts';

export default function Calendar() {
  return <ActivityCalendar {...calendarProps} />;
}
