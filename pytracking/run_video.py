import os
import sys
import argparse

env_path = os.path.join(os.path.dirname(__file__), '..')
if env_path not in sys.path:
    sys.path.append(env_path)

from pytracking.evaluation import Tracker


def run_video(tracker_name, tracker_param, input_videofile, output_videofile=None, optional_box=None, debug=None, save_results=False):
    """Run the tracker on a video.
    args:
        tracker_name: Name of tracking method.
        tracker_param: Name of parameter file.
        input_videofile: Path to the input video (mp4)
        output_videofile: Path to the output video (mp4)
        optional_bbox: Path to the bounding boxes (txt)
        debug: Debug level.
        save_results: Bool if we want to save the predictions
    """
    tracker = Tracker(tracker_name, tracker_param)
    tracker.run_video_generic(input_videofilepath=input_videofile, ouput_videofilepath=output_videofile, optional_box=optional_box, debug=debug, save_results=save_results, ui=ui)

def main():
    parser = argparse.ArgumentParser(description='Run the tracker on a video.')
    parser.add_argument('tracker_name', type=str, help='Name of tracking method.')
    parser.add_argument('tracker_param', type=str, help='Name of parameter file.')
    parser.add_argument('input_videofile', type=str, help='path to the input video.')
    parser.add_argument('--output_videofile', type=str, help='path to the saved video.')
    parser.add_argument('--optional_bbox', type=str, help='path to the file containing bounding boxes with format x y w h.')
    parser.add_argument('--debug', type=int, default=0, help='Debug level.')
    parser.add_argument('--save_results', dest='save_results', action='store_true', help='Save bounding boxes')
    parser.set_defaults(save_results=False)

    args = parser.parse_args()

    run_video(args.tracker_name, args.tracker_param, args.input_videofile, args.output_videofile, args.optional_box, args.debug, args.save_results, args.ui)


if __name__ == '__main__':
    main()
