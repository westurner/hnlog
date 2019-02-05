#!/usr/bin/env python3

import json

def estimate_score(path='index.html.json', default_comment_points=1):
    with open(path, 'rb') as f:
        data = json.load(f)
    total_score = 0
    for d in data['items'].values():
        if d.get('by') == 'westurner':
            score = d.get('score', default_comment_points)
            total_score += float(score)
    return total_score

if __name__ == "__main__":
    import sys
    cfg = {}
    cfg['path'] = sys.argv[1] if len(sys.argv) > 1 else 'index.html.json'
    cfg['default_comment_points'] = sys.argv[2] if len(sys.argv) > 2 else 1.0
    print(repr(cfg), file=sys.stderr)
    score_estimate = estimate_score(
        cfg['path'],
        cfg['default_comment_points'])
    print(score_estimate)
